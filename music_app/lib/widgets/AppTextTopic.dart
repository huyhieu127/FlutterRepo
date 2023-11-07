import 'package:flutter/widgets.dart';
import 'package:music_app/helper/AppColor.dart';

import 'AppInkWell.dart';

class AppTextTopic extends StatelessWidget {
  const AppTextTopic({super.key, required this.label, required this.buttonName, this.onTapButton});

  final String label;
  final String buttonName;
  final GestureTapCallback? onTapButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColor.text1,
              fontSize: 20,
              fontWeight: FontWeight.w700,
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
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
