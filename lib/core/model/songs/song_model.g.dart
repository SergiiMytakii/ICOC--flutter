// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SongModelImpl _$$SongModelImplFromJson(Map<String, dynamic> json) =>
    _$SongModelImpl(
      id: (json['id'] as num).toInt(),
      songs: (json['songs'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$LanguagesEnumMap, k),
            SongVersion.fromJson(e as Map<String, dynamic>)),
      ),
      chords: (json['chords'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry($enumDecode(_$LanguagesEnumMap, k),
            Chords.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$SongModelImplToJson(_$SongModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'songs': instance.songs
          .map((k, e) => MapEntry(_$LanguagesEnumMap[k]!, e.toJson())),
      'chords': instance.chords
          ?.map((k, e) => MapEntry(_$LanguagesEnumMap[k]!, e.toJson())),
    };

const _$LanguagesEnumMap = {
  Languages.en: 'en',
  Languages.et: 'et',
  Languages.fr: 'fr',
  Languages.de: 'de',
  Languages.bg: 'bg',
  Languages.it: 'it',
  Languages.lv: 'lv',
  Languages.lt: 'lt',
  Languages.no: 'no',
  Languages.pl: 'pl',
  Languages.ro: 'ro',
  Languages.ru: 'ru',
  Languages.es: 'es',
  Languages.sv: 'sv',
  Languages.uk: 'uk',
  Languages.sk: 'sk',
  Languages.sl: 'sl',
  Languages.fi: 'fi',
  Languages.sq: 'sq',
  Languages.eu: 'eu',
  Languages.be: 'be',
  Languages.bs: 'bs',
  Languages.ca: 'ca',
  Languages.hr: 'hr',
  Languages.cs: 'cs',
  Languages.da: 'da',
  Languages.nl: 'nl',
  Languages.el: 'el',
  Languages.hu: 'hu',
  Languages.ga: 'ga',
  Languages.lb: 'lb',
  Languages.mk: 'mk',
  Languages.pt: 'pt',
  Languages.sr: 'sr',
};

_$SongVersionImpl _$$SongVersionImplFromJson(Map<String, dynamic> json) =>
    _$SongVersionImpl(
      id: (json['id'] as num).toInt(),
      lang: json['lang'] as String,
      text: json['text'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      youtubeVideos: (json['youtubeVideos'] as List<dynamic>?)
          ?.map((e) => YoutubeVideo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SongVersionImplToJson(_$SongVersionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lang': instance.lang,
      'text': instance.text,
      'title': instance.title,
      'description': instance.description,
      'youtubeVideos': instance.youtubeVideos,
    };

_$ChordsImpl _$$ChordsImplFromJson(Map<String, dynamic> json) => _$ChordsImpl(
      id: (json['id'] as num).toInt(),
      chords: json['chords'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$ChordsImplToJson(_$ChordsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chords': instance.chords,
      'description': instance.description,
    };
