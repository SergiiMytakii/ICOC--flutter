class SongDetail {
  final int id;
  final Map description;
  final Map title;
  final Map text;
  final List? resources;
  final Map chords;

  SongDetail({
    required this.id,
    required this.title,
    required this.description,
    required this.text,
    required this.chords,
    this.resources,
  });

  factory SongDetail.fromJson(Map<String, dynamic> parsedJson) {
    //print(parsedJson);
    return SongDetail(
      id: parsedJson['Id'] ?? 0,
      title: parsedJson['title'] ?? '',
      text: parsedJson['text'] ?? '',
      description: parsedJson['description'] ?? '',
      resources: parsedJson['resourses'] ?? [],
      chords: parsedJson['chords'] ?? '',
    );
  }

  Map<String, Object?> toMapTitle() {
    return {
      'id_song': id,
      'ru': title['ru'],
      'uk': title['uk'],
      'en': title['en'],
    };
  }

  Map<String, Object?> toMapText() {
    return {
      'id': id,
      'ru1': text['ru1'],
      'ru2': text['ru2'],
      'uk1': text['uk1'],
      'uk2': text['uk2'],
      'en1': text['en1'],
      'en2': text['en2'],
    };
  }

  Map<String, Object?> toMapDescription() {
    return {
      'id_song': id,
      'ru': description['ru'],
      'uk': description['uk'],
      'en': description['en'],
    };
  }

  Map<String, Object?> toMapChords() {
    return {
      'id_song': id,
      'v1': chords['v1'],
      'v2': chords['v2'],
      'v3': chords['v3'],
      'v4': chords['v4'],
    };
  }

//todo may you don't need it
  // Map<String, Object?> toMapResources() {
  //   if (resources != null)
  //     return {
  //       'id': id,
  //       'ru1': resources!['ru1'],
  //       'ru2': resources!['ru2'],
  //       'uk1': resources!['uk1'],
  //       'uk2': resources!['uk2'],
  //       'en1': resources!['en1'],
  //       'en2': resources!['en2'],
  //     };
  //   else
  //     return {};
  // }
}
