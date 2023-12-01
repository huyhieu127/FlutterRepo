import 'package:flutter/material.dart';
import 'package:music_app/helper/AppColor.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? height;
  final TextOverflow? overflow;

  const AppText(
    this.text, {
    super.key,
    this.textAlign,
    this.color = AppColor.text1,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
    this.height,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
      ),
      overflow: overflow,
    );
  }

  const AppText.large(
    this.text, {
    super.key,
    this.textAlign,
    this.color = AppColor.text1,
    this.fontSize = 20,
    this.fontWeight = FontWeight.w700,
    this.height = 1.4,
    this.overflow,
  });

  const AppText.medium(
    this.text, {
    super.key,
    this.textAlign,
    this.color = AppColor.text1,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    this.height = 1.4,
    this.overflow,
  });

  const AppText.small(
    this.text, {
    super.key,
    this.textAlign,
    this.color = AppColor.text1,
    this.fontSize = 10,
    this.fontWeight = FontWeight.w200,
    this.height,
    this.overflow,
  });
}
