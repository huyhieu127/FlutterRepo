part of 'audio_cubit.dart';

abstract class AudioState extends Equatable {
  const AudioState();
}

class AudioInitialState extends AudioState {
  @override
  List<Object> get props => [];
}

class AudioPlayingState extends AudioState {
  @override
  List<Object?> get props => [];
}

class AudioPausedState extends AudioState {
  @override
  List<Object?> get props => [];
}

class AudioStoppedState extends AudioState {
  @override
  List<Object?> get props => [];
}