import '../../../index.dart';
import '../services/insta_public_api/insta_public_api.dart';

class KyivInstaNewsController extends GetxController {
  final ipa = InstaPublicApi('kcoc.ua');
  final RxList timelinePosts = [].obs;
  @override
  void onInit() {
    getInstaMedia();
    super.onInit();
  }

  getInstaMedia() async {
    final info = await ipa.getBasicInfo();

    print('Posts: ${info.noOfPosts}');
    print('Followers: ${info.followers}');
    print('Following: ${info.following}');
    timelinePosts.value = await ipa.getAllPosts();
    log.i(timelinePosts.first.displayUrl);
    log.i(timelinePosts.first.videoUrl);
  }
}
