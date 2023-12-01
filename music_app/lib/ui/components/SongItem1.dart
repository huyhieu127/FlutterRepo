import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/bloc/cubits/controller_item/controller_item_cubit.dart';
import 'package:music_app/helper/AppColor.dart';
import 'package:music_app/helper/AppShimmer.dart';
import 'package:music_app/models/SongModel.dart';
import 'package:music_app/widgets/AppControllerItem.dart';
import 'package:music_app/widgets/AppShimmerView.dart';
import 'package:shimmer/shimmer.dart';

import '../../bloc/cubits/home/home_cubit.dart';

class SongItem1 extends StatelessWidget {
  const SongItem1({
    super.key,
    required this.index,
    required this.onTap,
    required this.onTapPlay,
    required this.onTapAddPlaylist,
    required this.onTapDownload,
    required this.onTapMore,
    this.isLoading = false,
  });

  final int index;
  final GestureTapCallback onTap;
  final GestureTapCallback onTapPlay;
  final GestureTapCallback onTapAddPlaylist;
  final GestureTapCallback onTapDownload;
  final GestureTapCallback onTapMore;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final data = context.read<HomeCubit>().lstNewUpdate?[index];
    data?.controllerItemCubit = context.read<ControllerItemCubit>();
    return data != null ? _item(data) : _loading();
  }

  _loading() => const Shimmer(
        gradient: AppShimmer.shimmerGradient,
        child: Row(
          children: [
            AppShimmerView(width: 120, height: 120, radius: 24),
            SizedBox(width: 14),
            Expanded(
              child: SizedBox(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppShimmerView.shimmerText(width: double.infinity),
                    SizedBox(height: 8),
                    AppShimmerView.shimmerText(width: 70),
                    Expanded(child: SizedBox()),
                    AppShimmerView.shimmerText(width: 170),
                    SizedBox(height: 8),
                    AppShimmerView.shimmerText(),
                    SizedBox(width: 14)
                  ],
                ),
              ),
            ),
            SizedBox(width: 8),
          ],
        ),
      );

  _item(SongModel data) => GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                data.thumbnailUrl,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
                cacheWidth: 512,
                cacheHeight: 512,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: SizedBox(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Text(
                        data.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          height: 1.4,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Padding(
                      padding: const EdgeInsets.only(right: 24.0),
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              data.artist,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColor.text3,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            "|",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColor.text3,
                            ),
                            maxLines: 1,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            _timeToMinute(data.duration),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColor.text3,
                            ),
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    ControllerItem(
                        onTapPlay: onTapPlay,
                        onTapAddPlaylist: onTapAddPlaylist,
                        onTapDownload: onTapDownload,
                        onTapMore: onTapMore),
                    const SizedBox(width: 14)
                  ],
                ),
              ),
            )
          ],
        ),
      );
}

String _timeToMinute(num millisecond) {
  int totalSecond = (millisecond / 1000).floor();
  int hour = (totalSecond / 3600).floor();
  int minute = ((totalSecond / 3600 - hour) * 60).floor();
  int second = ((((totalSecond / 3600 - hour) * 60) - minute) * 60).floor();

  String result = [
    if (hour > 0) hour.toString().padLeft(2, "0"),
    minute.toString().padLeft(2, "0"),
    second.toString().padLeft(2, '0'),
  ].join(':');
  return result;
}
