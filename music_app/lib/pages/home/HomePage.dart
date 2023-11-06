import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/helper/AppDecoration.dart';
import 'package:music_app/helper/AppResource.dart';
import 'package:music_app/widgets/AppInkWell.dart';

import '../../helper/AppColor.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final subscriptions = [
    "$assetImage/thumbnail_1.jpeg",
    "$assetImage/thumbnail_2.jpg",
    "$assetImage/thumbnail_3.jpg",
    "$assetImage/thumbnail_4.jpg",
    "$assetImage/thumbnail_1.jpeg",
    "$assetImage/thumbnail_2.jpg",
    "$assetImage/thumbnail_3.jpg",
    "$assetImage/thumbnail_4.jpg",
    "$assetImage/thumbnail_1.jpeg",
    "$assetImage/thumbnail_2.jpg",
    "$assetImage/thumbnail_3.jpg",
    "$assetImage/thumbnail_4.jpg",
  ];
  final newUpdates = [
    "$assetImage/thumbnail_1.jpeg",
    "$assetImage/thumbnail_2.jpg",
    "$assetImage/thumbnail_3.jpg",
    "$assetImage/thumbnail_4.jpg",
    "$assetImage/thumbnail_1.jpeg",
    "$assetImage/thumbnail_2.jpg",
    "$assetImage/thumbnail_3.jpg",
    "$assetImage/thumbnail_4.jpg",
    "$assetImage/thumbnail_1.jpeg",
    "$assetImage/thumbnail_2.jpg",
    "$assetImage/thumbnail_3.jpg",
    "$assetImage/thumbnail_4.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.only(left: 24.0, top: 12, bottom: 12, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: Image.asset(
                        "$assetImage/avatar_female_small.jpg",
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Good Morning! 👋",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                            ),
                            Text(
                              "Taylor Swift",
                              style: TextStyle(
                                color: AppColor.text1,
                                fontWeight: FontWeight.w700,
                                height: 1.1,
                                fontSize: 20,
                              ),
                            ),
                          ],
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
                          padding: const EdgeInsets.all(10),
                          child: SvgPicture.asset("$assetIcon/ic_notification.svg"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Banner
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Container(
                  decoration: AppDecoration.boxDecorationLinearGradient(radius: 24),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 1,
                        bottom: 1,
                        child: Image.asset(
                          "$assetImage/person_1.png",
                          height: 150,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 100.0, left: 25.0, top: 20.0, bottom: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Enjoy All Benefits!",
                              style: TextStyle(
                                color: AppColor.icon2,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "Enjoy listening podcast with better audio quality, without restrictions and without ads",
                              style: TextStyle(
                                  color: AppColor.icon2,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.italic),
                            ),
                            const SizedBox(height: 14),
                            AppInkWell(
                              onTap: () {},
                              radius: 20,
                              decoration: AppDecoration.boxDecoration(
                                radius: 20,
                                color: AppColor.button2,
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                                child: Text(
                                  "Get Premium",
                                  style: TextStyle(
                                    color: AppColor.primary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Subscriptions
              const SizedBox(height: 16),
              Column(
                children: [
                  // Title
                  Padding(
                    padding: const EdgeInsets.only(left: 24, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Subscriptions",
                          style: TextStyle(
                            color: AppColor.text1,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        AppInkWell(
                          onTap: () {},
                          radius: 12,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            child: Text(
                              "See All",
                              style: TextStyle(
                                color: AppColor.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // List
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 100,
                    child: ListView.separated(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset(
                            subscriptions[index],
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 16),
                    ),
                  )
                ],
              ),

              // New Updates
              const SizedBox(height: 16),
              Column(
                children: [
                  // Title
                  Padding(
                    padding: const EdgeInsets.only(left: 24, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "New Updates",
                          style: TextStyle(
                            color: AppColor.text1,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        AppInkWell(
                          onTap: () {},
                          radius: 12,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            child: Text(
                              "See All",
                              style: TextStyle(
                                color: AppColor.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // List
                  const SizedBox(height: 12),
                  ListView.separated(
                    itemCount: 10,
                    //newUpdates.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image.asset(
                                newUpdates[index + 1],
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
                                    const Padding(
                                      padding: EdgeInsets.only(right: 24.0),
                                      child: Text(
                                        "Chúng ta của hiện tại chúng ta của hiện tại chúng ta của hiện tại chúng ta của hiện tại",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          height: 1.4,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const Expanded(child: SizedBox()),
                                    const Padding(
                                      padding: EdgeInsets.only(right: 24.0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            child: Text(
                                              "Sơn Tùng - MTP",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: AppColor.text3,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(width: 12),
                                          Text(
                                            "|",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: AppColor.text3,
                                            ),
                                            maxLines: 1,
                                          ),
                                          SizedBox(width: 12),
                                          Text(
                                            "4:46",
                                            style: TextStyle(
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
                                    Row(
                                      children: [
                                        AppInkWell(
                                          onTap: () {},
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
                                                    colorFilter:
                                                        const ColorFilter.mode(AppColor.icon2, BlendMode.srcIn),
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
                                          onTap: () {},
                                          child: SizedBox(
                                            width: 30,
                                            height: 30,
                                            child: Padding(
                                              padding: const EdgeInsets.all(6.0),
                                              child: SvgPicture.asset("$assetIcon/ic_add_playlist.svg"),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        AppInkWell(
                                          radius: 15,
                                          onTap: () {},
                                          child: SizedBox(
                                            width: 30,
                                            height: 30,
                                            child: Padding(
                                              padding: const EdgeInsets.all(6.0),
                                              child: SvgPicture.asset("$assetIcon/ic_download.svg"),
                                            ),
                                          ),
                                        ),
                                        const Expanded(child: SizedBox()),
                                        AppInkWell(
                                          radius: 15,
                                          onTap: () {},
                                          child: SizedBox(
                                            width: 30,
                                            height: 30,
                                            child: Padding(
                                              padding: const EdgeInsets.all(6.0),
                                              child: SvgPicture.asset("$assetIcon/ic_more.svg"),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 14),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 20),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
