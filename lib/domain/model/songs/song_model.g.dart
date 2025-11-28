// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SongModel _$SongModelFromJson(Map<String, dynamic> json) => _SongModel(
      id: (json['id'] as num).toInt(),
      songVersions: (json['songVersions'] as List<dynamic>)
          .map((e) => SongVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SongModelToJson(_SongModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'songVersions': instance.songVersions.map((e) => e.toJson()).toList(),
    };

_SongVersion _$SongVersionFromJson(Map<String, dynamic> json) => _SongVersion(
      id: (json['id'] as num).toInt(),
      lang: $enumDecode(_$LanguagesEnumMap, json['lang']),
      text: json['text'] as String,
      title: json['title'] as String,
      isChords: json['isChords'] as bool? ?? false,
      description: json['description'] as String?,
      youtubeVideos: (json['youtubeVideos'] as List<dynamic>?)
          ?.map((e) => YoutubeVideo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SongVersionToJson(_SongVersion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lang': _$LanguagesEnumMap[instance.lang]!,
      'text': instance.text,
      'title': instance.title,
      'isChords': instance.isChords,
      'description': instance.description,
      'youtubeVideos': instance.youtubeVideos?.map((e) => e.toJson()).toList(),
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
  Languages.defaultLang: 'defaultLang',
};

_SongVersionLocal _$SongVersionLocalFromJson(Map<String, dynamic> json) =>
    _SongVersionLocal(
      id: (json['id'] as num).toInt(),
      lang: json['lang'] as String,
      text: json['text'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$SongVersionLocalToJson(_SongVersionLocal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lang': instance.lang,
      'text': instance.text,
      'title': instance.title,
    };
