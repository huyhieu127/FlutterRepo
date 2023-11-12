import 'package:flutter/material.dart';
import 'package:music_app/components/GetPremium.dart';
import 'package:music_app/components/QuestionBottomSheet.dart';
import 'package:music_app/helper/AppColor.dart';
import 'package:music_app/helper/AppDecoration.dart';
import 'package:music_app/helper/AppResource.dart';
import 'package:music_app/widgets/AppHeader.dart';
import 'package:music_app/widgets/AppInkWell.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with AutomaticKeepAliveClientMixin {
  final settings = {
    "edit_profile": "Edit profile",
    "notification": "Notification",
    "downloads": "Downloads",
    "content_settings": "Content Settings",
    "security": "Security",
    "language": "Language",
    "dark_mode": "Dark Mode",
    "help_center": "Help Center",
  };

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Header
            AppHeader(
              label: "Profile",
              iconButton: "$assetIcon/ic_menu.svg",
              onTapButton: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return QuestionBottomSheet(
                      title: 'Logout',
                      titleColor: Colors.red,
                      widgetContent: const Text(
                        "Are you sure want to logout?",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onTapAccept: (context){
                        Navigator.pop(context);
                      },
                    );
                  },
                );
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0, top: 4, bottom: 8, right: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(35.0),
                                child: Image.asset(
                                  "$assetImage/avatar_female_small.jpg",
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                right: 1,
                                bottom: 1,
                                child: Container(
                                  width: 16,
                                  height: 16,
                                  decoration: AppDecoration.boxDecoration(radius: 4),
                                  child: const Icon(
                                    Icons.edit,
                                    color: AppColor.icon2,
                                    size: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Taylor Swift",
                                    style: TextStyle(
                                      color: AppColor.text1,
                                      fontWeight: FontWeight.w700,
                                      height: 1.1,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "taylor_swift@gmail.com",
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: GetPremium(),
                    ),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(12),
                      itemBuilder: (context, index) {
                        return AppInkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 6),
                                  child: Icon(
                                    Icons.settings_suggest_rounded,
                                    size: 28,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    settings.values.elementAt(index),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: settings.keys.elementAt(index) == "dark_mode",
                                  child: Switch(
                                    value: false,
                                    onChanged: (isSelected) {},
                                  ),
                                ),
                                Visibility(
                                  visible: settings.keys.elementAt(index) == "language",
                                  child: const Padding(
                                    padding: EdgeInsets.only(right: 6),
                                    child: Text(
                                      "EN",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(),
                      itemCount: settings.length,
                      shrinkWrap: true,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
