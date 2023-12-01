part of 'song_item_1_cubit.dart';

abstract class SongItem1State extends Equatable {
  const SongItem1State();
}

class SongItemInitialState extends SongItem1State {
  @override
  List<Object> get props => [];
}

class SongItemLoadingState extends SongItem1State {
  @override
  List<Object> get props => [];
}

class SongItemFillDataState extends SongItem1State {
  final SongModel data;

  const SongItemFillDataState({required this.data});

  @override
  List<Object> get props => [data];
}
