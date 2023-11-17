import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music_app/helper/AppResource.dart';

part 'home_new_updates_state.dart';

class HomeNewUpdatesCubit extends Cubit<HomeNewUpdatesState> {
  HomeNewUpdatesCubit() : super(HomeNewUpdatesInitial());

  void fetchData(){
    emit(HomeNewUpdatesLoading());
    Future.delayed(const Duration(seconds: 3),(){
      var newUpdates = [
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
      emit(HomeNewUpdatesSuccess(data: newUpdates));
    });
  }
}
