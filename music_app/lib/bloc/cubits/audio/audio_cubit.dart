import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/helper/AppLogger.dart';
import 'package:music_app/helper/AppResource.dart';
import 'package:music_app/models/SongModel.dart';

part 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  SongModel? song;
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioCubit() : super(AudioInitialState());

  Duration? _duration;
  Duration? _position;
  PlayerState? playerState;

  bool get isPlaying => _audioPlayer.playing;

  String get durationText => formatDuration(_duration);

  String get positionText => formatDuration(_position);

  onPlay(String? assetName, {int index = 0, bool isReset = false}) {
    isPlaying ? pause() : playAsset(assetName, index: index, isReset: isReset);
  }

  Future<void> playUrl(String url) async {
    await _audioPlayer.setUrl(url);
    play();
  }

  Future<void> playAsset(String? assetName, {int index = 0, bool isReset = false}) async {
    if (assetName != null && assetName.isNotEmpty) {
      final oldPath = _audioPlayer.sequenceState?.currentSource?.tag;
      final newPath = "$assetAudio/$assetName*$index";
      logger.i("playAsset: $oldPath - $newPath");
      if (oldPath != newPath || isReset) {
        print("Start new");
        final audioSource = AudioSource.asset("$assetAudio/$assetName", tag: newPath);
        _audioPlayer.setAudioSource(audioSource);
      }
      play();
    } else {
      logger.i("playAsset FAILD: $assetName");
      pause();
    }
  }

  void play() {
    _audioPlayer.play();
    emit(AudioPlayingState());
  }

  void pause() async {
    await _audioPlayer.pause();
    emit(AudioPausedState());
  }

  void stop() async {
    await _audioPlayer.stop();
    emit(AudioStoppedState());
  }

  double valueSlider() => (_position != null &&
          _duration != null &&
          _position!.inMilliseconds > 0 &&
          _position!.inMilliseconds < _duration!.inMilliseconds)
      ? _position!.inMilliseconds / _duration!.inMilliseconds
      : 0.0;

  void sliderChange(double value) {
    final duration = _duration;
    if (duration == null) {
      return;
    }
    final position = value * duration.inMilliseconds;
    _audioPlayer.seek(Duration(milliseconds: position.round()));
  }

  String formatDuration(Duration? duration) {
    if (duration == null) return "00:00";
    String text = duration.toString().split('.').first;
    String hText = text.padLeft(8, '0');
    String mText = "${text.split(':')[1]}:${text.split(':')[2]}";
    return duration.inMinutes > 59 ? hText : mText;
  }
}
