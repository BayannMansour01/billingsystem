import 'package:flutter/material.dart';
import 'package:sqflite/sql.dart';

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    //  throw UnimplementedError();
    Path path = Path();
    double radius = 24;
    path.moveTo(0, radius);
    //left
    path.quadraticBezierTo(0, 0, radius, 0);
    //top
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(radius / 2, size.height);
    //right
    path.quadraticBezierTo(
        radius / 2, size.height - radius / 2, 0, size.height - radius / 2);
    //bottom

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
