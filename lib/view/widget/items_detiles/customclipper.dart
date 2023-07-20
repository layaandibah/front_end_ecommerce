import 'package:flutter/cupertino.dart';

class CustomClipPathUp extends CustomClipper<Path> {


  @override
  getClip(Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*-0.0025000,size.height*0.0020000);
    path_0.lineTo(size.width*0.9987500,0);
    path_0.lineTo(size.width*0.9987500,size.height*0.1000000);
    path_0.quadraticBezierTo(size.width*0.8740625,size.height*0.4405000,size.width*0.4962500,size.height*0.3060000);
    path_0.quadraticBezierTo(size.width*0.1362500,size.height*0.2005000,size.width*-0.0012500,size.height*0.9940000);
    path_0.lineTo(size.width*-0.0012500,size.height*0.3680000);
    path_0.lineTo(size.width*-0.0025000,size.height*0.0020000);
    path_0.close();


    return  path_0;

  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
  return false;

  }

}
