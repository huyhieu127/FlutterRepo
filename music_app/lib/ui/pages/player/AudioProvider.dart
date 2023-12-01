import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';

class AudioProvider with ChangeNotifier {
  AudioPlayer _audioPlayer = AudioPlayer();

  AudioPlayer get audioPlayer => _audioPlayer;

  bool get isPlaying => _audioPlayer.playing;

  void play(String url) async {
    await _audioPlayer.setUrl(url);
    _audioPlayer.play();
    notifyListeners();
  }

  void pause() {
    _audioPlayer.pause();
    notifyListeners();
  }

  void stop() {
    _audioPlayer.stop();
    notifyListeners();
  }
}
