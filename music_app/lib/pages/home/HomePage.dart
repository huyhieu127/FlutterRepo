import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/components/GetPremium.dart';
import 'package:music_app/components/SongItem1.dart';
import 'package:music_app/components/SongItem2.dart';
import 'package:music_app/helper/AppColor.dart';
import 'package:music_app/helper/AppResource.dart';
import 'package:music_app/helper/AppRoute.dart';
import 'package:music_app/widgets/AppInkWell.dart';
import 'package:music_app/widgets/AppTextTopic.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
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
    super.build(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.only(left: 24.0, top: 8, bottom: 8, right: 12),
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

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    // Get Premium
                    const SizedBox(height: 8),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: GetPremium(),
                    ),
                    // Subscriptions
                    const SizedBox(height: 16),
                    Column(
                      children: [
                        // Title
                        AppTextTopic(
                          label: "Subscriptions",
                          buttonName: "See All",
                          onTapButton: () {},
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
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, AppRoute.library);
                                },
                                child: SongItem2(thumbnail: subscriptions[index]),
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
                        AppTextTopic(
                          label: "New Updates",
                          buttonName: "See All",
                          onTapButton: () {},
                        ),
                        // List
                        const SizedBox(height: 12),
                        ListView.separated(
                          itemCount: 10,
                          //newUpdates.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(bottom: 24),
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.only(left: 24, right: 14),
                                child: SongItem1(
                                  thumbnail: newUpdates[index + 1],
                                  title: 'Chúng ta của hiện tại và tương lai trong quá khứ tiếp diễn',
                                  author: 'Sơn Tường - ATM',
                                  time: 456000,
                                  onTapPlay: () {},
                                  onTapAddPlaylist: () {
                                    setState(() {
                                      //isAddedPlaylist = !isAddedPlaylist;
                                    });
                                  },
                                  onTapDownload: () {
                                    setState(() {
                                      //isDownloaded = !isDownloaded;
                                    });
                                  },
                                  onTapMore: () {},
                                  isAddedPlaylist: false,
                                  isDownloaded: false,
                                ));
                          },
                          separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 20),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
