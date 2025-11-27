// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bible_study.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BibleStudy _$BibleStudyFromJson(Map<String, dynamic> json) {
  return _BibleStudy.fromJson(json);
}

/// @nodoc
mixin _$BibleStudy {
  String get topic => throw _privateConstructorUsedError;
  String get subtopic => throw _privateConstructorUsedError;
  Languages get lang => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  List<Lesson> get lessons => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BibleStudyCopyWith<BibleStudy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BibleStudyCopyWith<$Res> {
  factory $BibleStudyCopyWith(
          BibleStudy value, $Res Function(BibleStudy) then) =
      _$BibleStudyCopyWithImpl<$Res, BibleStudy>;
  @useResult
  $Res call(
      {String topic,
      String subtopic,
      Languages lang,
      int id,
      List<Lesson> lessons});
}

/// @nodoc
class _$BibleStudyCopyWithImpl<$Res, $Val extends BibleStudy>
    implements $BibleStudyCopyWith<$Res> {
  _$BibleStudyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topic = null,
    Object? subtopic = null,
    Object? lang = null,
    Object? id = null,
    Object? lessons = null,
  }) {
    return _then(_value.copyWith(
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      subtopic: null == subtopic
          ? _value.subtopic
          : subtopic // ignore: cast_nullable_to_non_nullable
              as String,
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as Languages,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      lessons: null == lessons
          ? _value.lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<Lesson>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BibleStudyImplCopyWith<$Res>
    implements $BibleStudyCopyWith<$Res> {
  factory _$$BibleStudyImplCopyWith(
          _$BibleStudyImpl value, $Res Function(_$BibleStudyImpl) then) =
      __$$BibleStudyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String topic,
      String subtopic,
      Languages lang,
      int id,
      List<Lesson> lessons});
}

/// @nodoc
class __$$BibleStudyImplCopyWithImpl<$Res>
    extends _$BibleStudyCopyWithImpl<$Res, _$BibleStudyImpl>
    implements _$$BibleStudyImplCopyWith<$Res> {
  __$$BibleStudyImplCopyWithImpl(
      _$BibleStudyImpl _value, $Res Function(_$BibleStudyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topic = null,
    Object? subtopic = null,
    Object? lang = null,
    Object? id = null,
    Object? lessons = null,
  }) {
    return _then(_$BibleStudyImpl(
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      subtopic: null == subtopic
          ? _value.subtopic
          : subtopic // ignore: cast_nullable_to_non_nullable
              as String,
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as Languages,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      lessons: null == lessons
          ? _value._lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<Lesson>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$BibleStudyImpl implements _BibleStudy {
  const _$BibleStudyImpl(
      {required this.topic,
      required this.subtopic,
      required this.lang,
      required this.id,
      required final List<Lesson> lessons})
      : _lessons = lessons;

  factory _$BibleStudyImpl.fromJson(Map<String, dynamic> json) =>
      _$$BibleStudyImplFromJson(json);

  @override
  final String topic;
  @override
  final String subtopic;
  @override
  final Languages lang;
  @override
  final int id;
  final List<Lesson> _lessons;
  @override
  List<Lesson> get lessons {
    if (_lessons is EqualUnmodifiableListView) return _lessons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lessons);
  }

  @override
  String toString() {
    return 'BibleStudy(topic: $topic, subtopic: $subtopic, lang: $lang, id: $id, lessons: $lessons)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BibleStudyImpl &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.subtopic, subtopic) ||
                other.subtopic == subtopic) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._lessons, _lessons));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, topic, subtopic, lang, id,
      const DeepCollectionEquality().hash(_lessons));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BibleStudyImplCopyWith<_$BibleStudyImpl> get copyWith =>
      __$$BibleStudyImplCopyWithImpl<_$BibleStudyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BibleStudyImplToJson(
      this,
    );
  }
}

abstract class _BibleStudy implements BibleStudy {
  const factory _BibleStudy(
      {required final String topic,
      required final String subtopic,
      required final Languages lang,
      required final int id,
      required final List<Lesson> lessons}) = _$BibleStudyImpl;

  factory _BibleStudy.fromJson(Map<String, dynamic> json) =
      _$BibleStudyImpl.fromJson;

  @override
  String get topic;
  @override
  String get subtopic;
  @override
  Languages get lang;
  @override
  int get id;
  @override
  List<Lesson> get lessons;
  @override
  @JsonKey(ignore: true)
  _$$BibleStudyImplCopyWith<_$BibleStudyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Lesson _$LessonFromJson(Map<String, dynamic> json) {
  return _Lesson.fromJson(json);
}

/// @nodoc
mixin _$Lesson {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LessonCopyWith<Lesson> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonCopyWith<$Res> {
  factory $LessonCopyWith(Lesson value, $Res Function(Lesson) then) =
      _$LessonCopyWithImpl<$Res, Lesson>;
  @useResult
  $Res call({int id, String title, String text});
}

/// @nodoc
class _$LessonCopyWithImpl<$Res, $Val extends Lesson>
    implements $LessonCopyWith<$Res> {
  _$LessonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LessonImplCopyWith<$Res> implements $LessonCopyWith<$Res> {
  factory _$$LessonImplCopyWith(
          _$LessonImpl value, $Res Function(_$LessonImpl) then) =
      __$$LessonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title, String text});
}

/// @nodoc
class __$$LessonImplCopyWithImpl<$Res>
    extends _$LessonCopyWithImpl<$Res, _$LessonImpl>
    implements _$$LessonImplCopyWith<$Res> {
  __$$LessonImplCopyWithImpl(
      _$LessonImpl _value, $Res Function(_$LessonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? text = null,
  }) {
    return _then(_$LessonImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonImpl implements _Lesson {
  const _$LessonImpl(
      {required this.id, required this.title, required this.text});

  factory _$LessonImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String text;

  @override
  String toString() {
    return 'Lesson(id: $id, title: $title, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonImplCopyWith<_$LessonImpl> get copyWith =>
      __$$LessonImplCopyWithImpl<_$LessonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonImplToJson(
      this,
    );
  }
}

abstract class _Lesson implements Lesson {
  const factory _Lesson(
      {required final int id,
      required final String title,
      required final String text}) = _$LessonImpl;

  factory _Lesson.fromJson(Map<String, dynamic> json) = _$LessonImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$LessonImplCopyWith<_$LessonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
