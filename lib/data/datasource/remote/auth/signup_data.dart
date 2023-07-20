import 'package:ecommers/applinks.dart';
import 'package:ecommers/core/class/crud.dart';

//الكلاس اللي رح يتعامل مباشرة مع تابع http.post
//وظيفته يجيب الداتا المتغيرة
class SignUpData {
  Crud crud;

  SignUpData(this.crud);

  postData(String username, String email, String password, String phone) async {
    var res = await crud.postData(AppLinks.signup, {
      "username": username,
      "email": email,
      "password": password,
      "phone": phone,
    });
    return res.fold((left) => left, (right) => right);
  }
}
