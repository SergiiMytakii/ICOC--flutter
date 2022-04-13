import '../../../index.dart';

Future<AudioHandler> initAudioService() async {
  return await AudioService.init(
    builder: () => MyAudioHandler(),
    config: AudioServiceConfig(
      androidNotificationChannelId: 'ru.icoc.app',
      androidNotificationChannelName: 'ICOC',
      androidNotificationOngoing: true,
      androidStopForegroundOnPause: true,
    ),
  );
}

class MyAudioHandler extends BaseAudioHandler {
  @override
  MyAudioHandler() {
    _notifyAudioHandlerAboutPlaybackEvents();
  }

  GetxVideoPlayerController controller = Get.put(GetxVideoPlayerController());

  @override
  Future<void> play() async {
    playbackState.add(playbackState.value.copyWith(
      playing: true,
      controls: [MediaControl.pause],
    ));
    log.e('play');
    controller.myVideoExtPlayerController.play();
  }

  @override
  Future<void> pause() async {
    playbackState.add(playbackState.value.copyWith(
      playing: false,
      controls: [MediaControl.play],
    ));
    log.e('pause');
    controller.youtubePlayerController.pause();
  }

  void _notifyAudioHandlerAboutPlaybackEvents() {
    // controller.myVideoExtPlayerController.listen((event) {
    //   playbackState.add(playbackState.value.copyWith(
    //     controls: [
    //       MediaControl.skipToPrevious,
    //       // if (event.playerState == PlayerState.playing)
    //       MediaControl.pause,
    //       //  else
    //       MediaControl.play,
    //       MediaControl.stop,
    //       MediaControl.skipToNext,
    //     ],
    //     systemActions: const {
    //       MediaAction.seek,
    //     },
    //     androidCompactActionIndices: const [0, 1, 3],
    //     playing: _player.playing,
    //     //updatePosition: event.position,
    //   ));
    // });
  }
}
