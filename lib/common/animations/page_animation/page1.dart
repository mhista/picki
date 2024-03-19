// Page Transition
import 'package:flutter/material.dart';

class PageTransition extends PageRouteBuilder {
  final Widget page;
  PageTransition(this.page)
      : super(
            pageBuilder: (context, animation, anotherAnimation) => page,
            transitionDuration: const Duration(milliseconds: 1200),
            reverseTransitionDuration: const Duration(milliseconds: 300),
            transitionsBuilder: (context, animation, anotherAnimation, child) {
              animation = CurvedAnimation(
                  curve: Curves.fastLinearToSlowEaseIn,
                  parent: animation,
                  reverseCurve: Curves.fastOutSlowIn);
              return Align(
                  alignment: Alignment.bottomCenter,
                  child: SizeTransition(
                    sizeFactor: animation,
                    axisAlignment: 0,
                    child: page,
                  ));
            });
}
