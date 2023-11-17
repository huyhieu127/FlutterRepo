import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/helper/AppResource.dart';
import 'package:music_app/models/UserForm.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  UserForm? userForm;

  Future<void> fetchHomeData() async {
    emit(HomeLoadingState());
    Future.delayed(const Duration(seconds: 1), () {
      var user = UserForm("$assetImage/avatar_male_small.jpg", "James", "Aurora", true, false);
      emit(HomeUserState(user: user));
      emit(HomeNotificationState(isNotification: user.isNotification));
      emit(HomePremiumState(isPremium: user.isPremium));
    });
  }

  fetchSubscriptions() {
    emit(const HomeSubscriptionsState(isLoading: true, data: null, error: null));
    Future.delayed(const Duration(seconds: 2), () {
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
      emit(HomeSubscriptionsState(isLoading: false, data: subscriptions, error: null));
    });
  }

  getPremium(){
    emit(const HomePremiumState(isPremium: true));
  }

  fetchNewUpdates() {
    emit(const HomeNewUpdatesState(isLoading: true, data: null, error: null));
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
      emit(HomeNewUpdatesState(isLoading: false, data: newUpdates, error: null));
    });
  }
}
