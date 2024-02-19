import 'package:flutter/material.dart';

class PCustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    final firstPoint = Offset(0, size.height - 20);
    final lastPoint = Offset(30, size.height - 20);
    path.quadraticBezierTo(
        firstPoint.dx, firstPoint.dy, lastPoint.dx, lastPoint.dy);

    final secondfirstPoint = Offset(0, size.height - 20);
    final secondlastPoint = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(secondfirstPoint.dx, secondfirstPoint.dy,
        secondlastPoint.dx, secondlastPoint.dy);

    final thirdFirstPoint = Offset(size.width, size.height - 20);
    final thirdLastPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(thirdFirstPoint.dx, thirdFirstPoint.dy,
        thirdLastPoint.dx, thirdLastPoint.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
    // final firstPoint = Offset(0,size.height-20);
    // final firstPoint = Offset(0,size.height-20);
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
