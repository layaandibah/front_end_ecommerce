import 'package:ecommers/applinks.dart';
import 'package:ecommers/core/class/crud.dart';

//الكلاس اللي رح يتعامل مباشرة مع تابع http.post
//وظيفته يجيب الداتا المتغيرة
class VerifyCodeData {
  Crud crud;

  VerifyCodeData(this.crud);

  postData(String? email, String? verifycde) async {
    var res = await crud.postData(
        AppLinks.verifycode, {"email": email, "verifycode": verifycde});
    return res.fold((left) => left, (right) => right);
  }
}
