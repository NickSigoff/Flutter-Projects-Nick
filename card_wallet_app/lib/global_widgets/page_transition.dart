import 'package:flutter/material.dart';

class PageTransition extends PageRouteBuilder {
  final Widget page;
  final Axis axis;
  final Alignment alignment;

  PageTransition(
      {required this.page,
      this.axis = Axis.horizontal,
      this.alignment = Alignment.center})
      : super(
            pageBuilder: (context, animation, anotherAnimation) => page,
            transitionDuration: const Duration(milliseconds: 700),
            transitionsBuilder: (context, animation, anotherAnimation, child) {
              animation = CurvedAnimation(
                  parent: animation, curve: Curves.fastOutSlowIn);
              return Align(
                alignment: alignment,
                child: SizeTransition(
                  axis: axis,
                  sizeFactor: animation,
                  child: page,
                ),
              );
            });
}
