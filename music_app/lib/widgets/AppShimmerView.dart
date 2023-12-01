import 'package:flutter/material.dart';
import 'package:music_app/helper/AppColor.dart';

class AppShimmerView extends StatelessWidget {
  const AppShimmerView(
      {super.key,
      required this.width,
      required this.height,
      required this.radius});

  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Container(width: width, height: height, color: AppColor.shimmer),
    );
  }

  const AppShimmerView.shimmerText({
    super.key,
    this.width = 100,
    this.height = 20,
    this.radius = 10,
  });
}
