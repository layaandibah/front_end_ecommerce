import 'package:flutter/cupertino.dart';

class TopClipperSetting extends CustomClipper<Path>{
  @override
  getClip(Size size) {


    Path path_0 = Path();
    path_0.moveTo(0,size.height*1.0020000);
    path_0.lineTo(0,0);
    path_0.lineTo(size.width,size.height*0.0020000);
    path_0.lineTo(size.width*1.0004125,size.height*1.0040000);
    path_0.quadraticBezierTo(size.width*0.9540750,size.height*1.0027400,size.width*0.8161000,size.height*1.0032400);
    path_0.cubicTo(size.width*0.6585625,size.height*0.9955800,size.width*0.7327375,size.height*0.4510600,size.width*0.5000000,size.height*0.4443800);
    path_0.cubicTo(size.width*0.2603875,size.height*0.4683000,size.width*0.3425250,size.height*0.9946000,size.width*0.1719125,size.height*1.0026400);
    path_0.quadraticBezierTo(size.width*0.1048250,size.height*1.0031400,0,size.height*1.0020000);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
   return false;
  }



}