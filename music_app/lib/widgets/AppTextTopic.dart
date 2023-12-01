import 'package:flutter/widgets.dart';
import 'package:music_app/helper/AppColor.dart';
import 'package:music_app/widgets/AppText.dart';

import 'AppInkWell.dart';

class AppTextTopic extends StatelessWidget {
  const AppTextTopic(
      {super.key,
      required this.label,
      required this.buttonName,
      this.onTapButton});

  final String label;
  final String buttonName;
  final GestureTapCallback? onTapButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: AppText.large(
              label,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          AppInkWell(
            onTap: onTapButton,
            radius: 12,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Text(
                buttonName,
                style: const TextStyle(
                  color: AppColor.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
