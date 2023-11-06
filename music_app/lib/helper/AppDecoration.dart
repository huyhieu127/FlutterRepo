import 'package:flutter/material.dart';

import 'AppColor.dart';

class AppDecoration {
  AppDecoration._();

  ///Variables///
  static final Shader _shaderLinearGradient = const LinearGradient(colors: <Color>[
    AppColor.startColor,
    AppColor.endColor,
  ]).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  static ShaderCallback shaderLinearGradientCallback = (Rect bounds) {
    return _shaderLinearGradient;
  };

  static Paint paintLinearGradient = Paint()..shader = AppDecoration._shaderLinearGradient;

  ///Methods///
  static boxDecoration({double radius = 16, int alpha = 20, Color? color}) => BoxDecoration(
        color: color ?? AppColor.primary,
        borderRadius: BorderRadius.circular(radius),
      );

  static borderInkWell({double radius = 16}) => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      );

  static boxDecorationLinearGradient({double radius = 16}) => ShapeDecoration.fromBoxDecoration(
        BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColor.startColor,
              AppColor.endColor,
            ],
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
      );
}
