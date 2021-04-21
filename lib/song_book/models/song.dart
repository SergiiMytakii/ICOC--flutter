
class Song {
  final int id;
  final Map description;
  final Map title;
  final Map text;
  final List? resources;
  final Map chords;

  Song(
      {required this.id,
        required this.title,
        required this.description,
        required this.text,
        required this.chords,
      this.resources,
      });

  factory Song.fromJson(Map<String, dynamic> parsedJson){
    //print(parsedJson);
    return Song(
      id: parsedJson['Id'],
      title: parsedJson['title'],
      text : parsedJson ['text'],
      description: parsedJson ['description'],
      resources: null,
      chords: parsedJson ['chords'],

    );
  }


  Map<String, Object?> toMapTitle() {
    return {
      'id': id,
      'ru': title['ru'] ?? null, // null - it's test
      'uk': title['uk'] ?? null,
      'en': title['en'] ?? null,
    };
  }

  Map<String, Object?> toMapText() {
    return {
      'id': id,
      'ru1': text['ru1'] ?? null,
      'ru2': text['ru2'] ?? null,
      'uk1': text['uk1'] ?? null,
      'uk2': text['uk2'] ?? null,
      'en1': text['en1'] ?? null,
      'en2': text['en2'] ?? null,
    };
  }

  Map<String, Object?> toMapDescription() {
    return {
      'id': id,
      'ru': description['ru'] ?? null,
      'uk': description['uk'] ?? null,
      'en': description['en'] ?? null,
    };
  }

  Map<String, Object?> toMapChords() {
    return {
      'id': id,
      'v1': chords['v1'] ?? null,
      'v2': chords['v2'] ?? null,
      'v3': chords['v3'] ?? null,
      'v4': chords['v4'] ?? null,

    };
  }
}




