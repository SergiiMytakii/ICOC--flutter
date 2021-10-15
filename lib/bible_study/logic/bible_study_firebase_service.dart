import 'package:icoc/bible_study/models/bible_study.dart';

import '/index.dart';

class BibleStudyServiceFirebase {
  var log = Logger();
  //get access to database
  final CollectionReference bibleStudyCollection =
      FirebaseFirestore.instance.collection('BibleStudy');

  Future get bibleStudies async {
    var bibleStudies = await bibleStudyCollection
        //.where('subtopic', isEqualTo: 'основы христианства')
        .get();

    return bibleStudies;
  }
}
