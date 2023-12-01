import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

late AudioHandler audioHandler;

Future<void> initialAudioService({required AudioPlayerHandler audioPlayerHandler}) async {
  audioHandler = await AudioService.init(
    builder: () => audioPlayerHandler,
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.huyhieu.music_app.channel_audio',
      androidNotificationChannelName: 'Audio playback',
      androidNotificationOngoing: true,
    ),
  );
}

/// An [AudioHandler] for playing a single item.
class AudioPlayerHandler extends BaseAudioHandler with SeekHandler {
  final player = AudioPlayer();

  /// Initialise our audio handler.
  playItemUrl({required MediaItem mediaItem}) {
    player.playbackEventStream.map(_transformEvent).pipe(playbackState);
    this.mediaItem.add(mediaItem);
    player.setAudioSource(AudioSource.uri(Uri.parse(mediaItem.id)));
  }

  playItemAsset({required MediaItem mediaItem}) {
    player.playbackEventStream.map(_transformEvent).pipe(playbackState);
    this.mediaItem.add(mediaItem);
    player.setAudioSource(AudioSource.asset(mediaItem.id));
  }

  // In this simple example, we handle only 4 actions: play, pause, seek and
  // stop. Any button press from the Flutter UI, notification, lock screen or
  // headset will be routed through to these 4 methods so that you can handle
  // your audio playback logic in one place.

  @override
  Future<void> play() => player.play();

  @override
  Future<void> pause() => player.pause();

  @override
  Future<void> seek(Duration position) => player.seek(position);

  @override
  Future<void> stop() => player.stop();

  /// Transform a just_audio event into an audio_service state.
  ///
  /// This method is used from the constructor. Every event received from the
  /// just_audio player will be transformed into an audio_service state so that
  /// it can be broadcast to audio_service clients.
  PlaybackState _transformEvent(PlaybackEvent event) {
    return PlaybackState(
      controls: [
        MediaControl.rewind,
        if (player.playing) MediaControl.pause else MediaControl.play,
        MediaControl.stop,
        MediaControl.fastForward,
      ],
      systemActions: const {
        MediaAction.seek,
        MediaAction.seekForward,
        MediaAction.seekBackward,
      },
      androidCompactActionIndices: const [0, 1, 3],
      processingState: const {
        ProcessingState.idle: AudioProcessingState.idle,
        ProcessingState.loading: AudioProcessingState.loading,
        ProcessingState.buffering: AudioProcessingState.buffering,
        ProcessingState.ready: AudioProcessingState.ready,
        ProcessingState.completed: AudioProcessingState.completed,
      }[player.processingState]!,
      playing: player.playing,
      updatePosition: player.position,
      bufferedPosition: player.bufferedPosition,
      speed: player.speed,
      queueIndex: event.currentIndex,
    );
  }
}
