import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/bloc/cubits/audio/audio_cubit.dart';
import 'package:music_app/bloc/cubits/controller_item/controller_item_cubit.dart';
import 'package:music_app/bloc/cubits/home/home_cubit.dart';
import 'package:music_app/bloc/cubits/song_item_1/song_item_1_cubit.dart';
import 'package:music_app/helper/AppColor.dart';
import 'package:music_app/helper/AppResource.dart';
import 'package:music_app/helper/AppRoute.dart';
import 'package:music_app/helper/AppShimmer.dart';
import 'package:music_app/models/UserForm.dart';
import 'package:music_app/ui/components/GetPremium.dart';
import 'package:music_app/ui/components/SongItem1.dart';
import 'package:music_app/ui/components/SongItem2.dart';
import 'package:music_app/widgets/AppInkWell.dart';
import 'package:music_app/widgets/AppShimmerView.dart';
import 'package:music_app/widgets/AppTextTopic.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  final homeCubit = HomeCubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callApi();
  }

  Future<void> callApi() async {
    await homeCubit.fetchHomeData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) {
        return homeCubit;
      },
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.only(left: 24.0, top: 8, bottom: 8, right: 12),
                child: BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (p, c) => c is HomeLoadingState || c is HomeUserState,
                  builder: (context, state) {
                    return _header(
                      isLoading: state is! HomeUserState,
                      user: state is HomeUserState ? state.user : null,
                    );
                  },
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Get Premium
                      BlocBuilder<HomeCubit, HomeState>(
                        buildWhen: (p, c) =>
                            c is HomeInitial || c is HomeLoadingState || c is HomePremiumState,
                        builder: (context, state) {
                          if (state is HomePremiumState) {
                            return Visibility(
                              visible: !state.isPremium,
                              child: Column(
                                children: [
                                  const SizedBox(height: 16),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                                    child: GetPremium(
                                      getPremiumTap: () {
                                        homeCubit.getPremium();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return const Shimmer(
                              gradient: AppShimmer.shimmerGradient,
                              child: Column(
                                children: [
                                  SizedBox(height: 16),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                                    child: AppShimmerView(width: double.infinity, height: 180, radius: 25),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                      ), // Subscriptions
                      const SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          BlocBuilder<HomeCubit, HomeState>(
                            buildWhen: (p, c) => c is HomeUserState || c is HomeLoadingState,
                            builder: (context, state) {
                              if (state is HomeUserState) {
                                return AppTextTopic(
                                  label: "Subscriptions",
                                  buttonName: "See All",
                                  onTapButton: () {},
                                );
                              }
                              return const Shimmer(
                                gradient: AppShimmer.shimmerGradient,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 24),
                                  child: AppShimmerView.shimmerText(
                                    width: 250,
                                  ),
                                ),
                              );
                            },
                          ), // List
                          const SizedBox(height: 12),
                          SizedBox(
                            height: 100,
                            child: BlocBuilder<HomeCubit, HomeState>(
                                buildWhen: (p, c) => c is HomeSubscriptionsState,
                                builder: (context, state) {
                                  List<String>? listItem;
                                  bool isLoading = true;
                                  if (state is HomeSubscriptionsState) {
                                    listItem = state.data;
                                    isLoading = state.isLoading;
                                  }
                                  return ListView.separated(
                                    physics: isLoading ? const NeverScrollableScrollPhysics() : null,
                                    itemCount: listItem?.length ?? 5,
                                    scrollDirection: Axis.horizontal,
                                    padding: const EdgeInsets.symmetric(horizontal: 24),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(context, AppRoute.library);
                                        },
                                        child: SongItem2(
                                          thumbnail: listItem?[index] ?? "",
                                          isLoading: isLoading,
                                        ),
                                      );
                                    },
                                    separatorBuilder: (BuildContext context, int index) =>
                                        const SizedBox(width: 16),
                                  );
                                }),
                          )
                        ],
                      ),

                      // New Updates
                      const SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          BlocBuilder<HomeCubit, HomeState>(
                            buildWhen: (p, c) => c is HomeUserState || c is HomeLoadingState,
                            builder: (context, state) {
                              if (state is HomeUserState) {
                                return AppTextTopic(
                                  label: "New Updates",
                                  buttonName: "See All",
                                  onTapButton: () {},
                                );
                              }
                              return const Shimmer(
                                gradient: AppShimmer.shimmerGradient,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 24),
                                  child: AppShimmerView.shimmerText(
                                    width: 200,
                                  ),
                                ),
                              );
                            },
                          ), // List
                          const SizedBox(height: 12),
                          BlocConsumer<HomeCubit, HomeState>(
                            listener: (context, state) {
                              if (state is HomeNewUpdatesState) {
                                homeCubit.lstNewUpdate = state.data;
                              }
                            },
                            listenWhen: (p, c) => c is HomeNewUpdatesState,
                            buildWhen: (p, c) => c is HomeNewUpdatesState,
                            builder: (context, state) {
                              return ListView.separated(
                                itemCount: homeCubit.lstNewUpdate?.length ?? 5,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: const EdgeInsets.only(bottom: 24),
                                itemBuilder: (context, index) {
                                  return MultiBlocProvider(
                                    providers: [
                                      BlocProvider<SongItem1Cubit>(create: (_) => SongItem1Cubit()),
                                      BlocProvider<ControllerItemCubit>(create: (_) => ControllerItemCubit()),
                                    ],
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 24, right: 14),
                                      child: SongItem1(
                                        index: index,
                                        onTap: () {
                                          final audioCubit = context.read<AudioCubit>();
                                          _onOpenNewUpdate(index: index, audioCubit: audioCubit);
                                          audioCubit.song = homeCubit.songPlaying;
                                          Navigator.pushNamed(context, AppRoute.justAudio);
                                        },
                                        onTapPlay: () {
                                          _onPlayNewUpdate(
                                              index: index, audioCubit: context.read<AudioCubit>());
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
                                    ),
                                  );
                                },
                                separatorBuilder: (BuildContext context, int index) =>
                                    const SizedBox(height: 20),
                              );
                            },
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
      ),
    );
  }

  _header({required bool isLoading, required UserModel? user}) {
    if (isLoading) {
      return const Shimmer(
        gradient: AppShimmer.shimmerGradient,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppShimmerView(width: 50, height: 50, radius: 25),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppShimmerView.shimmerText(width: 150),
                    SizedBox(height: 4),
                    AppShimmerView.shimmerText(width: 80),
                  ],
                ),
              ),
            ),
            AppShimmerView(width: 40, height: 40, radius: 20),
            SizedBox(width: 10),
          ],
        ),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: Image.asset(
              user?.avatarUrl ?? "$assetImage/avatar_female_small.jpg",
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Good Morning! 👋",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "${user?.firstName ?? "Taylor"} ${user?.lastName ?? "Swift"}",
                    style: const TextStyle(
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
            onTap: () {
              homeCubit.fetchHomeData();
            },
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
      );
    }
  }

  @override
  bool get wantKeepAlive => true;

  _onOpenNewUpdate({required int index, required AudioCubit audioCubit}) {
    final currentSong = homeCubit.lstNewUpdate?[index];
    final songPlaying = homeCubit.songPlaying;

    audioCubit.playSong(currentSong, index: index);
    if (currentSong != songPlaying && songPlaying != null) {
      homeCubit.resetStatePlayer();
    }
    homeCubit.updateStatePlayer(index, audioCubit.isPlaying);
  }

  _onPlayNewUpdate({required int index, required AudioCubit audioCubit}) {
    final currentSong = homeCubit.lstNewUpdate?[index];
    final songPlaying = homeCubit.songPlaying;

    if (currentSong == songPlaying) {
      audioCubit.onPlay(currentSong, index: index);
    } else {
      audioCubit.playSong(currentSong, index: index);
      homeCubit.resetStatePlayer();
    }
    homeCubit.updateStatePlayer(index, audioCubit.isPlaying);
  }
}
