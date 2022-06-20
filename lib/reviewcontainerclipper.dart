import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReviewContainerClipper extends CustomClipper<Path> {
  final bool review;
  const ReviewContainerClipper({Key? key,this.review=false});
  @override
  Path getClip(Size size){

    var path = Path();
    print(size.height);
    if(!review){
      path.lineTo(size.width*0.21, 0);
      path.quadraticBezierTo(size.width*0.30, 50, size.width*0.38, 0);
    }
    else{
      path.lineTo(size.width-(size.width*0.40), 0);
      path.quadraticBezierTo(size.width-(size.width*0.32),50,size.width-(size.width*0.22), 0);
    }

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();

    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}