import '../../../../index.dart';
import 'package:firebase_storage/firebase_storage.dart';

String path = '/VerseOfTheDay';

class FirebaseImagesService {
  final log = Logger();
  static Future<List<String>> _getDownloadLinks(List<Reference> refs) =>
      Future.wait(refs.map((ref) => ref.getDownloadURL()).toList());
//получает список со всеми url
  static Future<List<String>> listAll(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    final result = await ref.listAll();
    //var url = await ref.getDownloadURL();
    final urls = await _getDownloadLinks(result.items);

    return urls;
  }

  static Future<String> getUrl(String path, int imageName) async {
    final ref = FirebaseStorage.instance.ref(path).child('$imageName.jpeg');

    final url = await ref.getDownloadURL();
    //Logger().e(url);

    return url;
  }
}
