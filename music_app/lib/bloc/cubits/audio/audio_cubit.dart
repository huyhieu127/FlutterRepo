import 'package:audio_service/audio_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/helper/AppLogger.dart';
import 'package:music_app/helper/AppResource.dart';
import 'package:music_app/models/SongModel.dart';
import 'package:music_app/ui/audio_notification/AudioPlayerHandler.dart';

part 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  AudioPlayerHandler audioPlayerHandler;
  AudioCubit({required this.audioPlayerHandler}) : super(AudioInitialState());

  SongModel? song;
  Duration? _duration;
  Duration? _position;
  PlayerState? playerState;

  AudioPlayer get _audioPlayer => audioPlayerHandler.player;

  bool get isPlaying => _audioPlayer.playing;

  String get durationText => formatDuration(_duration);

  String get positionText => formatDuration(_position);

  onPlay(SongModel? song, {int index = 0, bool isReset = false}) {
    isPlaying ? pause() : playSong(song, index: index, isReset: isReset);
  }

  Future<void> playUrl(String url) async {
    await _audioPlayer.setUrl(url);
    play();
  }

  Future<void> playAsset(String? assetName, {int index = 0, bool isReset = false}) async {
    if (assetName != null && assetName.isNotEmpty) {
      final oldPath = _audioPlayer.sequenceState?.currentSource?.tag;
      final newPath = "$assetAudio/$assetName*$index";
      if (oldPath != newPath ||
          _audioPlayer.playerState == PlayerState(false, ProcessingState.completed) ||
          isReset) {
        final audioSource = AudioSource.asset("$assetAudio/$assetName", tag: newPath);
        _audioPlayer.setAudioSource(audioSource);
      }
      play();
    } else {
      logger.i("playAsset FAILD: $assetName");
      pause();
    }
  }

  Future<void> playSong(SongModel? song, {int index = 0, bool isReset = false}) async {
    if (song != null && song.assetName.isNotEmpty) {
      final oldPath = _audioPlayer.sequenceState?.currentSource?.tag;
      final newPath = "$assetAudio/${song.assetName}*$index";
      if (oldPath != newPath ||
          _audioPlayer.playerState == PlayerState(false, ProcessingState.completed) ||
          isReset) {
        // final audioSource = AudioSource.asset("$assetAudio/$assetName", tag: newPath);
        // _audioPlayer.setAudioSource(audioSource);

        final mediaItem = MediaItem(
          id: "$assetAudio/${song.assetName}",
          album: "Science Friday",
          title: song.name,
          artist: song.artist,
          duration: const Duration(milliseconds: 5739820),
          artUri: Uri.parse('https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg'),
        );
        audioPlayerHandler.playItemAsset(mediaItem: mediaItem);
      }
      play();
    } else {
      logger.i("playAsset FAILED");
      pause();
    }
  }

  void play() {
    audioPlayerHandler.play();
    emit(AudioPlayingState());
  }

  void pause() async {
    await audioPlayerHandler.pause();
    emit(AudioPausedState());
  }

  void stop() async {
    await audioPlayerHandler.stop();
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
    audioPlayerHandler.seek(Duration(milliseconds: position.round()));
  }

  String formatDuration(Duration? duration) {
    if (duration == null) return "00:00";
    String text = duration.toString().split('.').first;
    String hText = text.padLeft(8, '0');
    String mText = "${text.split(':')[1]}:${text.split(':')[2]}";
    return duration.inMinutes > 59 ? hText : mText;
  }
}
