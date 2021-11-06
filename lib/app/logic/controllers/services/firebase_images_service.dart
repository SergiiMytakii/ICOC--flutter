import '../../../../index.dart';

String path = '/VerseOfTheDay';

class FirebaseImagesService {
  static Future<List<String>> _getDownloadLinks(List<Reference> refs) =>
      Future.wait(refs.map((ref) => ref.getDownloadURL()).toList());

  static Future<List<FirebaseFile>> listAll(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    final result = await ref.listAll();
    var url = await ref.getDownloadURL();
    final urls = await _getDownloadLinks(result.items);
    return urls
        .asMap()
        .map((index, url) {
          Logger().e(url);
          final ref = result.items[index];
          final name = ref.name;
          final file = FirebaseFile(reference: ref, name: name, url: url);
          return MapEntry(index, file);
        })
        .values
        .toList();
  }
}

class FirebaseFile {
  final Reference? reference;
  final String? name;
  final String? url;

  FirebaseFile({this.reference, this.name, this.url});
}
