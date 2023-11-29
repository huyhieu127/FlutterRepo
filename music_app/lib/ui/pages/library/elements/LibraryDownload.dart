import 'package:flutter/widgets.dart';
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
    return ListView.separated(
      itemCount: widget.downloads.length,
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 24, top: 24, bottom: 16, right: 14),
      itemBuilder: (context, index) {
        return SongItem1(
          thumbnail: widget.downloads[index],
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
          isDownloaded: true,
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: 20),
    );
  }
}
