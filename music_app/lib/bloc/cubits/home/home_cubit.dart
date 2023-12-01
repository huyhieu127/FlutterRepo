import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/helper/AppResource.dart';
import 'package:music_app/models/SongModel.dart';
import 'package:music_app/models/UserForm.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitial());
  UserModel? userForm;
  List<SongModel>? lstNewUpdate;
  SongModel? songPlaying;

  Future<void> fetchHomeData() async {
    emit(const HomeLoadingState());
    emit(const HomeSubscriptionsState(isLoading: true, data: null, error: null));
    emit(const HomeNewUpdatesState(isLoading: true, data: null, error: null));

    await Future.delayed(const Duration(seconds: 1), () {
      var user = UserModel("$assetImage/avatar_male_small.jpg", "James", "Aurora", true, false);
      emit(HomeUserState(user: user));
      emit(HomeNotificationState(isNotification: user.isNotification));
      emit(HomePremiumState(isPremium: user.isPremium));
    });

    await fetchSubscriptions();
    await fetchNewUpdates();
  }

  Future<void> fetchSubscriptions() async {
    var subscriptions = await Future.delayed(
      const Duration(seconds: 1),
      () => [
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
      ],
    );
    emit(HomeSubscriptionsState(isLoading: false, data: subscriptions, error: null));
  }

  Future<void> fetchNewUpdates() async {
    var newUpdates = await Future.delayed(
      const Duration(seconds: 1),
      () => [
        SongModel(
          assetName: "enchanted-chimes-177906.mp3",
          thumbnailUrl: "$assetImage/thumbnail_1.jpeg",
          name: "Chúng ta của hiện tại và tương lai trong quá khứ tiếp diễn",
          artist: "Sơn Tường - ATM",
          duration: 456000,
        ),
        SongModel(
          assetName: "enchanted-chimes-177906.mp3",
          thumbnailUrl: "$assetImage/thumbnail_2.jpg",
          name: "Chúng ta của hiện tại và tương lai trong quá khứ tiếp diễn",
          artist: "Sơn Tường - ATM",
          duration: 456000,
        ),
        SongModel(
          assetName: "enchanted-chimes-177906.mp3",
          thumbnailUrl: "$assetImage/thumbnail_3.jpg",
          name: "Chúng ta của hiện tại và tương lai trong quá khứ tiếp diễn",
          artist: "Sơn Tường - ATM",
          duration: 456000,
        ),
        SongModel(
          assetName: "enchanted-chimes-177906.mp3",
          thumbnailUrl: "$assetImage/thumbnail_4.jpg",
          name: "Chúng ta của hiện tại và tương lai trong quá khứ tiếp diễn",
          artist: "Sơn Tường - ATM",
          duration: 456000,
        ),
        SongModel(
          assetName: "enchanted-chimes-177906.mp3",
          thumbnailUrl: "$assetImage/thumbnail_1.jpeg",
          name: "Chúng ta của hiện tại và tương lai trong quá khứ tiếp diễn",
          artist: "Sơn Tường - ATM",
          duration: 456000,
        ),
        SongModel(
          assetName: "enchanted-chimes-177906.mp3",
          thumbnailUrl: "$assetImage/thumbnail_2.jpg",
          name: "Chúng ta của hiện tại và tương lai trong quá khứ tiếp diễn",
          artist: "Sơn Tường - ATM",
          duration: 456000,
        ),
        SongModel(
          assetName: "enchanted-chimes-177906.mp3",
          thumbnailUrl: "$assetImage/thumbnail_3.jpg",
          name: "Chúng ta của hiện tại và tương lai trong quá khứ tiếp diễn",
          artist: "Sơn Tường - ATM",
          duration: 456000,
        ),
        SongModel(
          assetName: "enchanted-chimes-177906.mp3",
          thumbnailUrl: "$assetImage/thumbnail_4.jpg",
          name: "Chúng ta của hiện tại và tương lai trong quá khứ tiếp diễn",
          artist: "Sơn Tường - ATM",
          duration: 456000,
        ),
        SongModel(
          assetName: "enchanted-chimes-177906.mp3",
          thumbnailUrl: "$assetImage/thumbnail_1.jpeg",
          name: "Chúng ta của hiện tại và tương lai trong quá khứ tiếp diễn",
          artist: "Sơn Tường - ATM",
          duration: 456000,
        ),
        SongModel(
          assetName: "enchanted-chimes-177906.mp3",
          thumbnailUrl: "$assetImage/thumbnail_2.jpg",
          name: "Chúng ta của hiện tại và tương lai trong quá khứ tiếp diễn",
          artist: "Sơn Tường - ATM",
          duration: 456000,
        ),
        SongModel(
          assetName: "enchanted-chimes-177906.mp3",
          thumbnailUrl: "$assetImage/thumbnail_3.jpg",
          name: "Chúng ta của hiện tại và tương lai trong quá khứ tiếp diễn",
          artist: "Sơn Tường - ATM",
          duration: 456000,
        ),
        SongModel(
          assetName: "enchanted-chimes-177906.mp3",
          thumbnailUrl: "$assetImage/thumbnail_4.jpg",
          name: "Chúng ta của hiện tại và tương lai trong quá khứ tiếp diễn",
          artist: "Sơn Tường - ATM",
          duration: 456000,
        ),
      ],
    );
    emit(HomeNewUpdatesState(isLoading: false, data: newUpdates, error: null));
  }

  getPremium() {
    emit(const HomePremiumState(isPremium: true));
  }

  updateStatePlayer(int index, bool isPlaying) {
    try {
      final item = lstNewUpdate?[index];
      item?.isPlaying = isPlaying;
      item?.controllerItemCubit?.setPlayer(isPlaying);
      songPlaying = item;
    } catch (_) {}
  }

  resetStatePlayer() {
    try {
      if (songPlaying != null) {
        songPlaying?.isPlaying = false;
        songPlaying?.controllerItemCubit?.setPlayer(false);
      }
    } catch (_) {}
  }
}
