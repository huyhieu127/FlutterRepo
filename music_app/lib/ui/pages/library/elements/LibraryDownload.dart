import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/bloc/cubits/audio/audio_cubit.dart';
import 'package:music_app/bloc/cubits/controller_item/controller_item_cubit.dart';
import 'package:music_app/helper/AppRoute.dart';
import 'package:music_app/ui/components/SongItem1.dart';

class LibraryDownload extends StatefulWidget {
  const LibraryDownload({super.key, required this.downloads});

  final List<String> downloads;

  @override
  State<LibraryDownload> createState() => _LibraryDownloadState();
}

class _LibraryDownloadState extends State<LibraryDownload> {
  @override
  Widget build(BuildContext context) {
    final audioCubit = context.read<AudioCubit>();
    return ListView.separated(
      itemCount: widget.downloads.length,
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 24, top: 24, bottom: 16, right: 14),
      itemBuilder: (context, index) {
        return SongItem1(
          index: index,
          onTap: () {
            Navigator.pushNamed(context, AppRoute.justAudio);
            audioCubit.playAsset("enchanted-chimes-177906.mp3");
          },
          onTapPlay: () {
            audioCubit.isPlaying ? audioCubit.pause() : audioCubit.playAsset("enchanted-chimes-177906.mp3");
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
        );
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 20),
    );
  }
}
