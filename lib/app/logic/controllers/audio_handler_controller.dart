import 'package:icoc/app/logic/services/audio_handler.dart';
import 'package:icoc/index.dart';

//for playback
class AudioHandlerController extends GetxController {
  AudioHandler? audioHandler;

  @override
  void onInit() async {
    audioHandler = await initAudioService();

    super.onInit();
  }
}
