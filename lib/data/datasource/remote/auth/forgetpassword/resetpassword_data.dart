import 'package:ecommers/applinks.dart';
import 'package:ecommers/core/class/crud.dart';

//الكلاس اللي رح يتعامل مباشرة مع تابع http.post
//وظيفته يجيب الداتا المتغيرة
class ResetPasswordData {
  Crud crud;

  ResetPasswordData(this.crud);

  postData(String email, String password) async {
    var res = await crud.postData(AppLinks.resetpassword, {
      "email": email,
      "password": password,
    });
    return res.fold((left) => left, (right) => right);
  }
}
