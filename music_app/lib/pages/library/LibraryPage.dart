import 'package:flutter/material.dart';
import 'package:music_app/helper/AppColor.dart';
import 'package:music_app/helper/AppResource.dart';
import 'package:music_app/pages/library/elements/LibraryDownload.dart';
import 'package:music_app/pages/library/elements/LibrarySubsciption.dart';
import 'package:music_app/widgets/AppHeader.dart';
import 'package:music_app/widgets/AppIndicatorTab.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final _searchController = SearchController();
  final _searchFocusNode = FocusNode();

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
  final downloads = [
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
    var tabController = TabController(length: 2, vsync: this);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Header
            AppHeader(
              label: "My Library",
              iconButton: "$assetIcon/ic_menu.svg",
              onTapButton: () {},
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                isScrollable: true,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                labelPadding: const EdgeInsets.symmetric(horizontal: 16),
                labelColor: AppColor.primary,
                labelStyle: const TextStyle(
                  color: AppColor.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: const TextStyle(
                  color: AppColor.text3,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                // indicatorSize: TabBarIndicatorSize.label,
                // indicatorColor: AppColor.primary,
                indicator: const AppIndicatorTab(color: AppColor.primary, width: 40, thickness: 3),
                dividerColor: Colors.transparent,
                splashBorderRadius: BorderRadius.circular(8),
                controller: tabController,
                tabs: const [
                  Tab(text: "Subscriptions"),
                  Tab(text: "Downloads"),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                children: [
                  LibrarySubscription(subscriptions: subscriptions),
                  LibraryDownload(downloads: downloads),
                ],
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
