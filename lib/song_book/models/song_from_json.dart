class SongFromJson {
  final String? id;
  final String? description;
  final String? title;
  final String? text;
  final String? language;



  SongFromJson(
      {this.id,
      this.title,
      this.description,
      this.text,
        this.language
      });

  factory SongFromJson.fromJson(Map<String, dynamic> parsedJson){
    return SongFromJson(
        id: (parsedJson['id'] + 1).toString(),
        title: parsedJson['title'],
        text : parsedJson ['text'],
        description: parsedJson ['description'],
      language: parsedJson ['language']

    );
  }


}
