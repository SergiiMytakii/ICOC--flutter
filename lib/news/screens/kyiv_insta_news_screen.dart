import 'package:icoc/news/logic/controllers/kyiv_insta_news_controller.dart';

import '../../index.dart';
import '../logic/services/insta_public_api/models/basic_model.dart';

class KyivInstaNewsScreen extends StatelessWidget {
  final KyivInstaNewsController controller = Get.put(KyivInstaNewsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'drawer_news'.tr,
        ),
        backgroundColor: screensColors['news']!.withOpacity(0.8),
        centerTitle: true,
        actions: [],
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
              itemCount: controller.timelinePosts.length,
              itemBuilder: (context, index) => OnePost(
                    post: controller.timelinePosts[index],
                  ))),
    );
  }
}

class OnePost extends StatelessWidget {
  final Post post;

  const OnePost({Key? key, required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    log.d(post.caption.toString() +
        '\n' +
        post.displayUrl.toString() +
        '\n' +
        post.videoUrl.toString());
    return Container(
      child: Column(children: [
        Text(post.caption ?? ''),
        Image.network(post.displayUrl ?? '')
      ]),
    );
  }
}
