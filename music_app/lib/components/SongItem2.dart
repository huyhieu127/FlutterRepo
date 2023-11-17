import 'package:flutter/widgets.dart';
import 'package:music_app/helper/AppConfigs.dart';
import 'package:music_app/widgets/AppShimmerView.dart';
import 'package:shimmer/shimmer.dart';

class SongItem2 extends StatelessWidget {
  const SongItem2({super.key, required this.thumbnail, required this.isLoading});

  final String thumbnail;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return isLoading || thumbnail.isEmpty? _loading() : _item();
  }

  _loading() => const Shimmer(
        gradient: AppConfigs.shimmerGradient,
        child: AppShimmerView(width: 100, height: 100, radius: 24),
      );

  _item() => ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image.asset(
          thumbnail,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      );
}
