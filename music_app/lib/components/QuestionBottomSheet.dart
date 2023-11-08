import 'package:flutter/material.dart';
import 'package:music_app/helper/AppColor.dart';
import 'package:music_app/helper/AppDecoration.dart';

class QuestionBottomSheet extends StatelessWidget {
  const QuestionBottomSheet({
    super.key,
    required this.title,
    this.titleColor = AppColor.primary,
    this.widgetContent,
    this.textContent,
    this.labelCancel,
    this.labelAccept,
    this.onTapAccept,
    this.onTapCancel,
  });

  final String title;
  final Color titleColor;
  final Widget? widgetContent;
  final String? textContent;
  final String? labelCancel;
  final String? labelAccept;
  final Function(BuildContext)? onTapAccept;
  final Function(BuildContext)? onTapCancel;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          decoration: AppDecoration.boxDecorationDynamic(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            color: AppColor.bg2,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 12),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  width: 50,
                  height: 4,
                  decoration: AppDecoration.boxDecoration(
                    radius: 2,
                    color: AppColor.bg6,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      color: titleColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Divider(color: AppColor.divider),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: widgetContent ??
                      Text(
                        textContent ?? "",
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            _cancel(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primaryLight,
                            // shadowColor: AppColor.primaryShadow,
                            elevation: 0,
                          ),
                          child: Text(
                            labelCancel ?? "Cancel",
                            style: const TextStyle(
                              color: AppColor.primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          _accept(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primary,
                          shadowColor: AppColor.primaryShadow,
                          elevation: 4,
                        ),
                        child: Text(
                          labelAccept ?? "Yes, I'm sure",
                          style: const TextStyle(
                            color: AppColor.text2,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  _accept(BuildContext context) {
    onTapAccept != null ? onTapAccept!(context) : Navigator.pop(context);
  }

  _cancel(BuildContext context) {
    onTapCancel != null ? onTapCancel!(context) : Navigator.pop(context);
  }
}
