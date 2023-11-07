import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/helper/AppColor.dart';
import 'package:music_app/widgets/AppInkWell.dart';

class AppHeader extends StatefulWidget {
  const AppHeader({super.key, required this.label, required this.iconButton, this.onTapButton});

  final String label;
  final String iconButton;
  final GestureTapCallback? onTapButton;

  @override
  State<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, top: 8, bottom: 8, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            "assets/logo/ic_logo.svg",
            width: 30,
            height: 30,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                widget.label,
                style: const TextStyle(
                  color: AppColor.text1,
                  fontWeight: FontWeight.w700,
                  height: 1.1,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          AppInkWell(
            onTap: () {},
            radius: 25,
            child: SizedBox(
              width: 50,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  widget.iconButton,
                  colorFilter: const ColorFilter.mode(AppColor.button5, BlendMode.srcIn),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
