import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/bloc/cubits/audio/audio_cubit.dart';
import 'package:music_app/helper/AppColor.dart';
import 'package:music_app/helper/AppDecoration.dart';
import 'package:music_app/models/SongModel.dart';
import 'package:music_app/widgets/AppDivider.dart';
import 'package:music_app/widgets/AppInkWell.dart';
import 'package:music_app/widgets/AppText.dart';
import 'package:music_app/widgets/AppToolBar.dart';

class JustAudioPage extends StatefulWidget {
  const JustAudioPage({super.key});

  @override
  State<JustAudioPage> createState() => _JustAudioPageState();
}

class _JustAudioPageState extends State<JustAudioPage> {
  AudioCubit get _audioCubit => context.read();

  SongModel? get _song => _audioCubit.song;

  @override
  void dispose() {
    //_player.dispose();
    super.dispose();
  }

  /*@override
  void setState(VoidCallback fn) {
    // Subscriptions only can be closed asynchronously,
    // therefore events can occur after widget has been disposed.
    if (mounted) {
      super.setState(fn);
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppToolBar(
              title: _song?.assetName ?? "",
              onTapBack: () {
                Navigator.pop(context);
              },
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(54.0),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.asset(
                                  _song?.thumbnailUrl ?? "",
                                  fit: BoxFit.cover,
                                  cacheWidth: 512,
                                  cacheHeight: 512,
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            AppText.large(
                              _song?.name ?? "",
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            AppText(
                              _song?.artist ?? "",
                              fontWeight: FontWeight.w500,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const AppDivider(),
                  const SizedBox(height: 4),
                  Column(
                    children: [
                      Slider(
                        value: _audioCubit.valueSlider(),
                        onChanged: (value) {
                          _audioCubit.sliderChange(value);
                        },
                        activeColor: AppColor.primary,
                        allowedInteraction: SliderInteraction.slideOnly,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(_audioCubit.positionText, fontWeight: FontWeight.w500),
                            AppText(_audioCubit.durationText, fontWeight: FontWeight.w500),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Icon(Icons.skip_previous_rounded, size: 40),
                            AppInkWell(
                              onTap: () {
                                //_prev10();
                              },
                              child: const Icon(Icons.timer_10_rounded, size: 24),
                            ),
                            GestureDetector(
                              onTap: () {
                                _audioCubit.isPlaying ? _audioCubit.pause() : _audioCubit.play();
                              },
                              child: ClipOval(
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: AppDecoration.boxDecorationLinearGradient(),
                                  child: Icon(
                                    _audioCubit.isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                                    size: 40,
                                    color: AppColor.button2,
                                  ),
                                ),
                              ),
                            ),
                            AppInkWell(
                              onTap: () {
                                //_next10();
                              },
                              child: const Icon(Icons.timer_10_rounded, size: 24),
                            ),
                            const Icon(Icons.skip_next_rounded, size: 40),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.speed_rounded),
                            Icon(Icons.access_alarm_rounded),
                            Icon(Icons.cast_rounded),
                            Icon(Icons.more_vert_outlined),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
