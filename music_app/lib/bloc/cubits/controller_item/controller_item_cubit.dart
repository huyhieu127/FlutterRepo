import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'controller_item_state.dart';

class ControllerItemCubit extends Cubit<ControllerItemState> {
  ControllerItemCubit() : super(ControllerItemInitialState());

  void setPlayer(bool isPlay) {
    emit(ControllerItemPlayerState(isPlaying: isPlay));
  }
}
