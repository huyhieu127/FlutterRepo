part of 'home_new_updates_cubit.dart';

abstract class HomeNewUpdatesState extends Equatable {
  const HomeNewUpdatesState();
}

class HomeNewUpdatesInitial extends HomeNewUpdatesState {
  @override
  List<Object> get props => [];
}
class HomeNewUpdatesLoading extends HomeNewUpdatesState {
  @override
  List<Object> get props => [];
}
class HomeNewUpdatesSuccess extends HomeNewUpdatesState {
  const HomeNewUpdatesSuccess({required this.data});

  final List<String> data;
  @override
  List<Object> get props => [data];
}
class HomeNewUpdatesError extends HomeNewUpdatesState {
  @override
  List<Object> get props => [];
}
