part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeUserState extends HomeState {
  const HomeUserState({required this.user});

  final UserForm user;

  @override
  List<Object> get props => [user];
}

class HomeNotificationState extends HomeState {
  const HomeNotificationState({required this.isNotification});

  final bool isNotification;

  @override
  List<Object> get props => [isNotification];
}

class HomePremiumState extends HomeState {
  const HomePremiumState({required this.isPremium});

  final bool isPremium;

  @override
  List<Object> get props => [isPremium];
}

class HomeSubscriptionsState extends HomeState {
  const HomeSubscriptionsState({required this.isLoading, required this.data, required this.error});

  final bool isLoading;
  final List<String>? data;
  final dynamic error;

  @override
  List<Object?> get props => [data];
}

class HomeNewUpdatesState extends HomeState {
  const HomeNewUpdatesState({required this.isLoading, required this.data, required this.error});

  final bool isLoading;
  final List<String>? data;
  final dynamic error;

  @override
  List<Object?> get props => [data];
}
