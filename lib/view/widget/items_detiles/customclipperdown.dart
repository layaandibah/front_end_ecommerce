import 'package:flutter/cupertino.dart';

class CustomClipPathDown extends CustomClipper<Path> {


  @override
  getClip(Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*1.0027375,size.height*1.0093600);
    path_0.lineTo(size.width*-0.0009875,size.height*1.0026200);
    path_0.lineTo(size.width*0.0014196,size.height*0.8926029);
    path_0.quadraticBezierTo(size.width*0.1347000,size.height*0.5759800,size.width*0.5125750,size.height*0.7100000);
    path_0.quadraticBezierTo(size.width*0.8726250,size.height*0.8150600,size.width*0.9972354,size.height*-0.0006208);
    path_0.lineTo(size.width*0.9987998,size.height*0.6253686);
    path_0.lineTo(size.width*1.0027375,size.height*1.0093600);
    path_0.close();


    return  path_0;

  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;

  }

}
