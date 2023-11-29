import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/helper/AppExtentions.dart';
import 'package:music_app/helper/AppResource.dart';
import 'package:music_app/models/UserForm.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitial());
  UserModel? userForm;

  Future<void> fetchHomeData() async {
    emitDelayed(const HomeLoadingState());
    emitDelayed(
        const HomeSubscriptionsState(isLoading: true, data: null, error: null));
    emitDelayed(
        const HomeNewUpdatesState(isLoading: true, data: null, error: null));

    await Future.delayed(const Duration(seconds: 1), () {
      var user = UserModel(
          "$assetImage/avatar_male_small.jpg", "James", "Aurora", true, false);
      emit(HomeUserState(user: user));
      emit(HomeNotificationState(isNotification: user.isNotification));
      emit(HomePremiumState(isPremium: user.isPremium));
    });

    fetchSubscriptions();
    fetchNewUpdates();
  }

  fetchSubscriptions() {
    Future.delayed(const Duration(seconds: 1), () {
      var subscriptions = [
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
      emit(HomeSubscriptionsState(
          isLoading: false, data: subscriptions, error: null));
    });
  }

  getPremium() {
    emit(const HomePremiumState(isPremium: true));
  }

  fetchNewUpdates() {
    Future.delayed(const Duration(seconds: 3), () {
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
      emit(
          HomeNewUpdatesState(isLoading: false, data: newUpdates, error: null));
    });
  }
}
