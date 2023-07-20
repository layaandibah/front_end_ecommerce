class AppLinks{

  static const String serverlink="http://192.168.3.214/ecommerce";
  //test

  static const String imageStatic="$serverlink/upload";
  static const String categoreisImages="$imageStatic/categories";
  static const String itemsImages="$imageStatic/items";


  //auth
  static const String signup="$serverlink/auth/signup.php";
  static const String login="$serverlink/auth/login.php";
  static const String verifycodeSignUp="$serverlink/auth/verifycode.php";
  static const String verifycode="$serverlink/forgetpassword/verifycode.php";
  static const String checkemail="$serverlink/forgetpassword/checkemail.php";
  static const String resetpassword="$serverlink/forgetpassword/resetpassword.php";
  //home
  static const String homepage="$serverlink/home.php";
  static const String search="$serverlink/search.php";
  static const String items=   "$serverlink/items/view.php";
  //productDetiles
  static const String productDetiles="$serverlink/productDetiles/view.php";
  //favorite
  static const String favoriteAdd="$serverlink/favorite/add.php";
  static const String favoriteRemove="$serverlink/favorite/remove.php";
  static const String favoriteView="$serverlink/favorite/view.php";
  //cart
  static const String cartAdd="$serverlink/cart/add.php";
  static const String cartDelete="$serverlink/cart/delete.php";
  static const String cartView="$serverlink/cart/view.php";
  static const String cartGetCount="$serverlink/cart/getcount.php";
  static const String checkcoupon="$serverlink/coupon/checkcoupon.php";
//address

  static const String addAddress="$serverlink/address/add.php";
  static const String deleteAddress="$serverlink/address/delete.php";
  static const String viewAddress="$serverlink/address/view.php";
  static const String editAddress="$serverlink/address/edit.php";


}