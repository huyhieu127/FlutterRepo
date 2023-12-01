import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/bloc/cubits/audio/audio_cubit.dart';
import 'package:music_app/bloc/cubits/controller_item/controller_item_cubit.dart';
import 'package:music_app/helper/AppResource.dart';
import 'package:music_app/helper/AppRoute.dart';
import 'package:music_app/ui/components/SongItem1.dart';
import 'package:music_app/ui/components/SongItem2.dart';
import 'package:music_app/widgets/AppHeader.dart';
import 'package:music_app/widgets/AppSearchBox.dart';
import 'package:music_app/widgets/AppTextTopic.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> with AutomaticKeepAliveClientMixin {
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
            AppHeader(
              label: "Discover",
              iconButton: "$assetIcon/ic_menu.svg",
              onTapButton: () {},
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    // Search
                    AppSearchBox(
                      controller: _searchController,
                      focusNode: _searchFocusNode,
                    ),
                    // Popular & Trending Authors
                    const SizedBox(height: 16),
                    Column(
                      children: [
                        // Title
                        AppTextTopic(
                          label: "Popular & Trending Authors",
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
                              return SongItem2(thumbnail: subscriptions[index], isLoading: false);
                            },
                            separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 16),
                          ),
                        )
                      ],
                    ),

                    // Most Listened Music
                    const SizedBox(height: 16),
                    Column(
                      children: [
                        // Title
                        AppTextTopic(
                          label: "Most Listened Music",
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
                            final audioCubit = context.read<AudioCubit>();
                            return Padding(
                              padding: const EdgeInsets.only(left: 24, right: 14),
                              child: SongItem1(
                                index: index,
                                onTap: () {
                                  Navigator.pushNamed(context, AppRoute.justAudio);
                                  audioCubit.playAsset("enchanted-chimes-177906.mp3");
                                },
                                onTapPlay: () {
                                  audioCubit.isPlaying
                                      ? audioCubit.pause()
                                      : audioCubit.playAsset("enchanted-chimes-177906.mp3");
                                  context.read<ControllerItemCubit>().setPlayer(audioCubit.isPlaying);
                                },
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
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
