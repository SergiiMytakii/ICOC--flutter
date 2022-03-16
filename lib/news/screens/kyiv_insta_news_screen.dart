import 'package:icoc/news/logic/controllers/kyiv_insta_news_controller.dart';
import 'package:icoc/news/screens/kyiv_insta_one_news.dart';

import '../../index.dart';

class KyivInstaNewsScreen extends StatelessWidget {
  final KyivInstaNewsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            'drawer_news'.tr,
          ),
          backgroundColor: screensColors['news']!.withOpacity(0.8),
          centerTitle: true,
          actions: [],
        ),
        body: controller.timelinePosts.isNotEmpty
            ? ListView.builder(
                itemCount: controller.timelinePosts.length,
                itemBuilder: (context, index) => OnePost(
                      post: controller.timelinePosts[index],
                    ))
            : Column(
                children: [
                  Loading(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'use vpn if something not works'.tr,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class OnePost extends StatelessWidget {
  final Post post;

  const OnePost({Key? key, required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    log.d(post.videoUrl);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: GestureDetector(
        onTap: () => Get.to(() => KyivInstaOneNewsScreen(
              post: post,
            )),
        child: Column(children: [
          Stack(children: [
            SizedBox(
              height: Get.width - 32,
              width: Get.width - 32,
              child: Image.network(
                post.displayUrl ?? '',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              child: Icon(
                post.isVideo ? Icons.play_arrow : Icons.library_books,
                color: Colors.white,
                size: 36,
              ),
              top: 10,
              right: 10,
            )
          ])
        ]),
      ),
    );
  }
}
