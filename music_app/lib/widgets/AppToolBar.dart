import 'package:flutter/material.dart';
import 'package:music_app/widgets/AppInkWell.dart';
import 'package:music_app/widgets/AppText.dart';

class AppToolBar extends StatelessWidget {
  final String title;
  final GestureTapCallback? onTapBack;
  final GestureTapCallback? onTapMenu;

  const AppToolBar({
    super.key,
    required this.title,
    this.onTapBack,
    this.onTapMenu,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          AppInkWell(
            radius: 25,
            onTap: onTapBack,
            child: const SizedBox(
              width: 50,
              height: 50,
              child: Center(
                child: Icon(
                  Icons.arrow_back_rounded,
                  size: 30,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: AppText.large(
                title,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          AppInkWell(
            radius: 25,
            onTap: onTapMenu,
            child: const SizedBox(
              width: 50,
              height: 50,
              child: Center(
                child: Icon(
                  Icons.more_vert_rounded,
                  size: 26,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
