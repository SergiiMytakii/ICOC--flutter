class Song {
  final String? id;
  final Map? description;
  final Map? title;
  final Map? text;
  final List? resources;
  final String? createdAt;
  final Map? chords;

  Song(
      {this.id,
      this.title,
      this.description,
      this.text,
      this.chords,
      this.resources,
      this.createdAt});
}
