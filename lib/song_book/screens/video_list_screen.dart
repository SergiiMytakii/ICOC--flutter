import '../../index.dart';

class VideoListScreen extends StatelessWidget {
  final SongsController controller = Get.find();
  final SongDetail song = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MediaQuery.of(context).orientation == Orientation.portrait
          ? AppBar(
              title: Text('Video & audio'.tr),
              backgroundColor: screensColors['songBook'],
            )
          : null,
      body: ListView.builder(
        itemBuilder: (context, index) => MyYoutubePlayer(
          video: song.resources![index],
        ),
        itemCount: song.resources!.length,
      ),
    );
  }
}
