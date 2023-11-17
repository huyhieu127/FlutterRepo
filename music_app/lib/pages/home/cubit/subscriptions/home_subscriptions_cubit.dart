import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:music_app/helper/AppResource.dart';

part 'home_subscriptions_state.dart';

class HomeSubscriptionsCubit extends Cubit<HomeSubscriptionsState> {
  HomeSubscriptionsCubit() : super(HomeSubscriptionsInitial());

  dynamic fetchData() {
    emit(HomeSubscriptionsLoading());
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
      emit(HomeSubscriptionsSuccess(data: subscriptions));
    });
  }
}
