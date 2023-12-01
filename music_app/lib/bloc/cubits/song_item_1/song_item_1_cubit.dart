import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music_app/models/SongModel.dart';

part 'song_item_1_state.dart';

class SongItem1Cubit extends Cubit<SongItem1State> {
  SongItem1Cubit() : super(SongItemInitialState());

  void fillData(SongModel? data) {
    if (data == null) return;
    emit(SongItemFillDataState(data: data));
  }
}
