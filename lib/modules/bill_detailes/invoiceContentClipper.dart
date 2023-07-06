import 'package:flutter/material.dart';
import 'package:sqflite/sql.dart';

class contentClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    //  throw UnimplementedError();
    Path path = Path();
    double radius = 24;
    double paperCropRaduis = 5;
    path.moveTo(radius / 2, 0);
    //left
    path.quadraticBezierTo(radius / 2, radius / 2, 0, radius / 2);
    //top
    path.lineTo(0, size.height);
    double maxwidth = size.width.abs();
    double sideoffset = (maxwidth % (paperCropRaduis * 3)) / 2;
    int numOfArc = (maxwidth / (paperCropRaduis * 3)).truncate();
    path.relativeLineTo(sideoffset, 0);
    for (int i = 0; numOfArc > i; i++) {
      path.relativeLineTo(paperCropRaduis * .5, 0);
      path.relativeArcToPoint(Offset(paperCropRaduis * 2, 0),
          radius: Radius.circular(paperCropRaduis));
      path.relativeLineTo(paperCropRaduis * .5, 0);
    }
    path.relativeLineTo(sideoffset, 0);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
