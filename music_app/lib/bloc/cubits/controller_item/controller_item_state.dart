part of 'controller_item_cubit.dart';

abstract class ControllerItemState extends Equatable {
  const ControllerItemState();
}

class ControllerItemInitialState extends ControllerItemState {
  @override
  List<Object> get props => [];
}

class ControllerItemPlayerState extends ControllerItemState {
  const ControllerItemPlayerState({required this.isPlaying});

  final bool isPlaying;

  @override
  List<Object> get props => [isPlaying];
}
