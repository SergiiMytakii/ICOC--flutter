
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
  }





