import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/helper/AppColor.dart';
import 'package:music_app/helper/AppDecoration.dart';
import 'package:music_app/helper/AppResource.dart';
import 'package:music_app/widgets/AppInkWell.dart';

class ControllerItem extends StatelessWidget {
  const ControllerItem({
    super.key,
    required this.onTapPlay,
    required this.onTapAddPlaylist,
    required this.onTapDownload,
    required this.onTapMore,
    this.isAddedPlaylist = true,
    this.isDownloaded = false,
  });

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
        AppInkWell(
          onTap: onTapPlay,
          radius: 20,
          decoration: AppDecoration.boxDecoration(radius: 20, color: AppColor.primary),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: 30,
              child: Row(
                children: [
                  SvgPicture.asset(
                    "$assetIcon/ic_play_filled.svg",
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(AppColor.icon2, BlendMode.srcIn),
                  ),
                  const SizedBox(width: 2),
                  const Text("Play",
                      style: TextStyle(
                        color: AppColor.icon2,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      )),
                  const SizedBox(width: 4),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        AppInkWell(
          radius: 15,
          onTap: onTapAddPlaylist,
          child: SizedBox(
            width: 30,
            height: 30,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: SvgPicture.asset(
                "$assetIcon/ic_add_playlist.svg",
                colorFilter: ColorFilter.mode(
                  isAddedPlaylist ? AppColor.button4 : AppColor.button5,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 4),
        AppInkWell(
          radius: 15,
          onTap: onTapDownload,
          child: SizedBox(
            width: 30,
            height: 30,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: SvgPicture.asset(
                "$assetIcon/ic_download.svg",
                colorFilter: ColorFilter.mode(
                  isDownloaded ? AppColor.button4 : AppColor.button5,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
        const Expanded(child: SizedBox()),
        AppInkWell(
          radius: 15,
          onTap: onTapMore,
          child: SizedBox(
            width: 30,
            height: 30,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: SvgPicture.asset(
                "$assetIcon/ic_more.svg",
                colorFilter: const ColorFilter.mode(
                  AppColor.button5,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
