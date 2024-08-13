// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YoutubeVideoImpl _$$YoutubeVideoImplFromJson(Map<String, dynamic> json) =>
    _$YoutubeVideoImpl(
      lang: $enumDecode(_$LanguagesEnumMap, json['lang']),
      title: json['title'] as String?,
      link: json['link'] as String,
      thumbnail: json['thumbnail'] as String?,
      artist: json['artist'] as String?,
      publishedAt: json['publishedAt'] as String?,
      description: json['description'] as String?,
      playlistId: json['playlistId'] as String?,
    );

Map<String, dynamic> _$$YoutubeVideoImplToJson(_$YoutubeVideoImpl instance) =>
    <String, dynamic>{
      'lang': _$LanguagesEnumMap[instance.lang]!,
      'title': instance.title,
      'link': instance.link,
      'thumbnail': instance.thumbnail,
      'artist': instance.artist,
      'publishedAt': instance.publishedAt,
      'description': instance.description,
      'playlistId': instance.playlistId,
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
