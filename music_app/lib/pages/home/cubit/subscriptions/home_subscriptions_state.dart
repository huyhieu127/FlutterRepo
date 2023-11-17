part of 'home_subscriptions_cubit.dart';

@immutable
abstract class HomeSubscriptionsState extends Equatable {
  const HomeSubscriptionsState();
}

class HomeSubscriptionsInitial extends HomeSubscriptionsState {
  @override
  List<Object?> get props => [];
}

class HomeSubscriptionsLoading extends HomeSubscriptionsState {
  @override
  List<Object?> get props => [];
}


class HomeSubscriptionsSuccess extends HomeSubscriptionsState {
  const HomeSubscriptionsSuccess({required this.data});

  final List<String> data;

  @override
  List<Object?> get props => [data];
}

class HomeSubscriptionsError extends HomeSubscriptionsState {
  @override
  List<Object?> get props => [];
}
