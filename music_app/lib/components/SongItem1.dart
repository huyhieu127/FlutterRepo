import 'package:flutter/widgets.dart';
import 'package:music_app/helper/AppColor.dart';

import '../widgets/ControllerItem.dart';

class SongItem1 extends StatelessWidget {
  const SongItem1({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.author,
    required this.time,
    required this.onTapPlay,
    required this.onTapAddPlaylist,
    required this.onTapDownload,
    required this.onTapMore,
    this.isAddedPlaylist = false,
    this.isDownloaded = false,
  });

  final String thumbnail;
  final String title;
  final String author;
  final num time;
  final GestureTapCallback onTapPlay;
  final GestureTapCallback onTapAddPlaylist;
  final GestureTapCallback onTapDownload;
  final GestureTapCallback onTapMore;

  final bool isAddedPlaylist;
  final bool isDownloaded;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Image.asset(
            thumbnail,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
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
                    title,
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
                          author,
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
                        _timeToMinute(time),
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
                  onTapMore: onTapMore,
                  isAddedPlaylist: isAddedPlaylist,
                  isDownloaded: isDownloaded,
                ),
                const SizedBox(width: 14)
              ],
            ),
          ),
        )
      ],
    );
  }
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
