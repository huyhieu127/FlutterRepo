import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/helper/AppColor.dart';
import 'package:music_app/helper/AppResource.dart';

class AppSearchBox extends StatefulWidget {
  const AppSearchBox({
    super.key,
    required this.controller,
    required this.focusNode,
    this.isReadOnly = false,
    this.onTap,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isReadOnly;
  final GestureTapCallback? onTap;

  @override
  State<AppSearchBox> createState() => _AppSearchBoxState();
}

class _AppSearchBoxState extends State<AppSearchBox> {
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(() {
      setState(() {
        _isFocused = widget.focusNode!.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    widget.controller.dispose();
    widget.focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var colorIcon = _isFocused ? AppColor.primary : AppColor.button6;
    var colorBorder = _isFocused ? AppColor.primary : Colors.transparent;
    var colorBackground = _isFocused ? AppColor.bg5 : AppColor.bg4;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.transparent),
        child: InkWell(
          child: TextField(
            controller: widget.controller,
            focusNode: widget.isReadOnly ? FocusNode() : widget.focusNode,
            onChanged: (text) {
              print('onChanged AppSearchBox: $text (${text.characters.length})');
            },
            readOnly: widget.isReadOnly,
            onTapOutside: (pointDown) {
              setState(() {
                widget.focusNode.unfocus();
              });
            },
            onTap: widget.onTap,
            textInputAction: TextInputAction.search,
            cursorColor: AppColor.primary,
            style: const TextStyle(color: AppColor.text1, fontWeight: FontWeight.w600, fontSize: 18, height: 1.3),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colorBorder),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colorBorder),
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: "Search",
              hintStyle: const TextStyle(color: AppColor.text4, fontWeight: FontWeight.w500, fontSize: 18),
              contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
              prefixIconConstraints: const BoxConstraints(minWidth: 24, maxHeight: 24),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 12, right: 8),
                child: SvgPicture.asset(
                  "$assetIcon/ic_search.svg",
                  width: 40,
                  height: 40,
                  colorFilter: ColorFilter.mode(colorIcon, BlendMode.srcIn),
                ),
              ),
              filled: true,
              fillColor: colorBackground,
            ),
          ),
        ),
      ),
    );
  }
}
