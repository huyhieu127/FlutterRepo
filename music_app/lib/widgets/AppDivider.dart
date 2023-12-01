import 'package:flutter/material.dart';
import 'package:music_app/helper/AppColor.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColor.divider,
      indent: 24,
      endIndent: 24,
      thickness: 1,
      height: 1,
    );
  }
}
