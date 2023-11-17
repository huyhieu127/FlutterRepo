import 'package:flutter/material.dart';

import '../helper/AppDecoration.dart';

class AppInkWell extends InkWell {
  const AppInkWell({super.key, super.onTap, this.radius = 16, this.decoration, super.child});

  @override
  final double radius;
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    return _displayInkWell();
  }

  Widget _displayInkWell() {
    if (decoration != null) {
      return Material(
        color: Colors.transparent,
        child: Ink(
          decoration: decoration,
          child: InkWell(
            customBorder: AppDecoration.borderInkWell(radius: radius),
            onTap: onTap,
            child: child,
          ),
        ),
      );
    } else {
      return InkWell(
        customBorder: AppDecoration.borderInkWell(radius: radius),
        onTap: onTap,
        child: child,
      );
    }
  }
}
