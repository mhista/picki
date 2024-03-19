import 'package:flutter/material.dart';

class PageTransition2 extends PageRouteBuilder {
  final Widget route;
  PageTransition2({required this.route})
      : super(
            pageBuilder: (context, animation, anotherAnimation) => route,
            transitionDuration: const Duration(milliseconds: 500),
            reverseTransitionDuration: const Duration(milliseconds: 300),
            transitionsBuilder: (context, animation, anotherAnimation, child) {
              // can also create tween here
              return ScaleTransition(scale: animation, child: child);
            });
}
