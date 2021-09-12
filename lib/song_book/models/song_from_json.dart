class SongFromJson {
  final String? id;
  final Map? description;
  final Map? title;
  final Map? text;
  final List? resources;
  final Map? chords;

  SongFromJson({
    this.id,
    this.title,
    this.description,
    this.text,
    this.chords,
    this.resources,
  });

  factory SongFromJson.fromJson(Map<String, dynamic> parsedJson) {
    return SongFromJson(
      id: (parsedJson['Id']).toString(),
      title: parsedJson['title'],
      text: parsedJson['text'],
      description: parsedJson['description'],
      resources: null,
      chords: parsedJson['chords'],
    );
  }
}
