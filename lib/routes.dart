import 'package:ecommers/core/middelware/mymiddleware.dart';
import 'package:ecommers/view/screen/address/add.dart';
import 'package:ecommers/view/screen/address/edit.dart';
import 'package:ecommers/view/screen/address/view.dart';
import 'package:ecommers/view/screen/auth/forgetpassword/success_resetpassword.dart';

import 'package:ecommers/core/constant/routes.dart';
import 'package:ecommers/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommers/view/screen/auth/login.dart';
import 'package:ecommers/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommers/view/screen/auth/success_signup.dart';
import 'package:ecommers/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommers/view/screen/auth/verifycodesignup.dart';
import 'package:ecommers/view/screen/cart_page.dart';
import 'package:ecommers/view/screen/favoritepage.dart';
import 'package:ecommers/view/screen/home_page.dart';
import 'package:ecommers/view/screen/homescreen.dart';
import 'package:ecommers/view/screen/items_page.dart';
import 'package:ecommers/view/screen/language.dart';
import 'package:ecommers/view/screen/notefication_page.dart';
import 'package:ecommers/view/screen/onboarding.dart';
import 'package:ecommers/view/screen/productdetiles.dart';
import 'package:ecommers/view/screen/profile_page.dart';
import 'package:ecommers/view/screen/search_page.dart';
import 'package:ecommers/view/screen/setting_page.dart';
import 'package:get/get.dart';


import 'view/screen/auth/signup.dart';

List<GetPage<dynamic>>? routes=[
  GetPage(name: "/", page:()=>Language(),middlewares: [
    MyMiddleWare(),
  ]
  ),
  GetPage(name: AppRoutes.login, page:()=>Login() ),
  GetPage(name: AppRoutes.signup , page:()=>SignUp() ),
  GetPage(name: AppRoutes.verifycode, page:()=>VerifyCode() ),
  GetPage(name: AppRoutes.forgetpassword, page:()=>ForgetPassword() ),
  GetPage(name: AppRoutes.resetpassword, page:()=>ResetPassword() ),
  GetPage(name: AppRoutes.successresetpassword, page:()=>SuccessResetPassword() ),
  GetPage(name: AppRoutes.successsignup, page:()=>SuccessSignUp() ),
  GetPage(name: AppRoutes.verifycodesignup, page:()=>VerifyCodeSignUp() ),
  //onboarding
  GetPage(name: AppRoutes.onboarding, page:()=>OnBoarding() ),
  //Home Screen
  GetPage(name: AppRoutes.homeScreen, page:()=>HomeScreen() ),
  //Pages
  GetPage(name: AppRoutes.homepage, page:()=>HomePage() ),
  GetPage(name: AppRoutes.profilePage, page:()=>ProfilePage() ),
  GetPage(name: AppRoutes.notificationPage, page:()=>NoteficationPage() ),
  GetPage(name: AppRoutes.settingPage, page:()=>SettingPage() ),
  GetPage(name: AppRoutes.cartPage, page:()=>const CartPage() ),
  GetPage(name: AppRoutes.itemsPage, page:()=>const Itemspage() ),
  GetPage(name: AppRoutes.productDetilesPage, page:()=>ProductDetiles() ),
  GetPage(name: AppRoutes.favoritePage, page:()=>const FavoritePage() ),
  GetPage(name: AppRoutes.searchPage, page:()=>const SearchPage() ),
  //address
  GetPage(name: AppRoutes.editAddress, page:()=>const EditAddress() ),
  GetPage(name: AppRoutes.addAddress, page:()=>const AddAddress() ),
  GetPage(name: AppRoutes.viewAddress, page:()=>const ViewAddress() ),




];
// Map<String, Widget Function(BuildContext)> routtes = {
//   //Auth
//   AppRoutes.login:(context)=> Login(),
//   AppRoutes.signup:(context)=> SignUp(),
//   AppRoutes.verifycode:(context)=>VerifyCode(),
//   AppRoutes.forgetpassword:(context)=>ForgetPassword(),
//   AppRoutes.resetpassword:(context)=>ResetPassword(),
//   AppRoutes.successresetpassword:(context)=>SuccessResetPassword(),
//   AppRoutes.successsignup:(context)=>SuccessSignUp(),
//   AppRoutes.verifycodesignup:(context)=>VerifyCodeSignUp(),
//   //onBoarding
//   AppRoutes.onboarding:(context)=>OnBoarding(),
// };