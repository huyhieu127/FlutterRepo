import '../bloc/cubits/controller_item/controller_item_cubit.dart';

class SongModel {
  final String assetName;
  final String thumbnailUrl;
  final String name;
  final String artist;
  final double duration;

  bool isPlaying = false;
  ControllerItemCubit? controllerItemCubit;

  SongModel({
    required this.assetName,
    required this.thumbnailUrl,
    required this.name,
    required this.artist,
    required this.duration,
  });
}
