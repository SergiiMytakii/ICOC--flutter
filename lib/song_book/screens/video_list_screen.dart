import '../../index.dart';

class VideoListScreen extends StatelessWidget {
  final SongDetail song;
  final SongsController controller = Get.find();

  VideoListScreen(this.song);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video & audio'.tr),
        backgroundColor: screensColors['songBook'],
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) =>
            VideoCard(resources: song.resources![index]),
        itemCount: song.resources!.length,
      ),
    );
  }
}
