import 'package:flutter/material.dart';

Route createRoute(Widget page, {bool isHorizontalTransition = true}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final begin = Offset(!isHorizontalTransition ? 0.0 : 1.0,
          !isHorizontalTransition ? 1.0 : 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
