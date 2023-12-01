import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/helper/AppColor.dart';
import 'package:music_app/helper/AppResource.dart';
import 'package:music_app/widgets/AppInkWell.dart';

class SongItem3 extends StatelessWidget {
  const SongItem3({super.key, required this.thumbnail, required this.author, required this.count, this.onTapMore});

  final String thumbnail;
  final String author;
  final int count;
  final GestureTapCallback? onTapMore;

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
            cacheWidth: 512,
            cacheHeight: 512,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(
                  author,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    height: 1.4,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "$count Songs",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColor.text3,
                ),
                maxLines: 1,
              ),
            ],
          ),
        ),
        AppInkWell(
          radius: 15,
          onTap: onTapMore,
          child: SizedBox(
            width: 40,
            height: 40,
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
        const SizedBox(width: 4)
      ],
    );
  }
}
