// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'q&a_model.freezed.dart';
part 'q&a_model.g.dart';

@freezed
class QandAModel with _$QandAModel {
  factory QandAModel(
      {required int id,
      required String title,
      required String question,
      required String answer,
      required String lang,
      String? date,
      String? author,
      String? link,
      String? image,
      String? source,
      String? translatedBy,
      String? youtubeLink,
      List<String>? tags}) = _QandAModel;

  factory QandAModel.fromJson(Map<String, dynamic> json) =>
      _$QandAModelFromJson(json);
}
