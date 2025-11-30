import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_author.freezed.dart';
part 'post_author.g.dart';

@freezed
abstract class PostAuthor with _$PostAuthor {
  const factory PostAuthor({
    required String name,
    required String avatarUrl,
  }) = _PostAuthor;

  factory PostAuthor.fromJson(Map<String, dynamic> json) =>
      _$PostAuthorFromJson(json);
}
