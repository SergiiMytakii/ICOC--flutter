// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'q&a_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QandAModel {
  int get id;
  @JsonKey(includeToJson: false)
  String get documentRef;
  String get title;
  String get question;
  String get answer;
  Languages get lang;
  String? get date;
  String? get author;
  String? get link;
  String? get image;
  String? get source;
  String? get translatedBy;
  String? get youtubeLink;
  List<String>? get tags;

  /// Create a copy of QandAModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QandAModelCopyWith<QandAModel> get copyWith =>
      _$QandAModelCopyWithImpl<QandAModel>(this as QandAModel, _$identity);

  /// Serializes this QandAModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QandAModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.documentRef, documentRef) ||
                other.documentRef == documentRef) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.translatedBy, translatedBy) ||
                other.translatedBy == translatedBy) &&
            (identical(other.youtubeLink, youtubeLink) ||
                other.youtubeLink == youtubeLink) &&
            const DeepCollectionEquality().equals(other.tags, tags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      documentRef,
      title,
      question,
      answer,
      lang,
      date,
      author,
      link,
      image,
      source,
      translatedBy,
      youtubeLink,
      const DeepCollectionEquality().hash(tags));

  @override
  String toString() {
    return 'QandAModel(id: $id, documentRef: $documentRef, title: $title, question: $question, answer: $answer, lang: $lang, date: $date, author: $author, link: $link, image: $image, source: $source, translatedBy: $translatedBy, youtubeLink: $youtubeLink, tags: $tags)';
  }
}

/// @nodoc
abstract mixin class $QandAModelCopyWith<$Res> {
  factory $QandAModelCopyWith(
          QandAModel value, $Res Function(QandAModel) _then) =
      _$QandAModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      @JsonKey(includeToJson: false) String documentRef,
      String title,
      String question,
      String answer,
      Languages lang,
      String? date,
      String? author,
      String? link,
      String? image,
      String? source,
      String? translatedBy,
      String? youtubeLink,
      List<String>? tags});
}

/// @nodoc
class _$QandAModelCopyWithImpl<$Res> implements $QandAModelCopyWith<$Res> {
  _$QandAModelCopyWithImpl(this._self, this._then);

  final QandAModel _self;
  final $Res Function(QandAModel) _then;

  /// Create a copy of QandAModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? documentRef = null,
    Object? title = null,
    Object? question = null,
    Object? answer = null,
    Object? lang = null,
    Object? date = freezed,
    Object? author = freezed,
    Object? link = freezed,
    Object? image = freezed,
    Object? source = freezed,
    Object? translatedBy = freezed,
    Object? youtubeLink = freezed,
    Object? tags = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      documentRef: null == documentRef
          ? _self.documentRef
          : documentRef // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _self.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _self.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      lang: null == lang
          ? _self.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as Languages,
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _self.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      translatedBy: freezed == translatedBy
          ? _self.translatedBy
          : translatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      youtubeLink: freezed == youtubeLink
          ? _self.youtubeLink
          : youtubeLink // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [QandAModel].
extension QandAModelPatterns on QandAModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_QandAModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QandAModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_QandAModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QandAModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_QandAModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QandAModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int id,
            @JsonKey(includeToJson: false) String documentRef,
            String title,
            String question,
            String answer,
            Languages lang,
            String? date,
            String? author,
            String? link,
            String? image,
            String? source,
            String? translatedBy,
            String? youtubeLink,
            List<String>? tags)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QandAModel() when $default != null:
        return $default(
            _that.id,
            _that.documentRef,
            _that.title,
            _that.question,
            _that.answer,
            _that.lang,
            _that.date,
            _that.author,
            _that.link,
            _that.image,
            _that.source,
            _that.translatedBy,
            _that.youtubeLink,
            _that.tags);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            int id,
            @JsonKey(includeToJson: false) String documentRef,
            String title,
            String question,
            String answer,
            Languages lang,
            String? date,
            String? author,
            String? link,
            String? image,
            String? source,
            String? translatedBy,
            String? youtubeLink,
            List<String>? tags)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QandAModel():
        return $default(
            _that.id,
            _that.documentRef,
            _that.title,
            _that.question,
            _that.answer,
            _that.lang,
            _that.date,
            _that.author,
            _that.link,
            _that.image,
            _that.source,
            _that.translatedBy,
            _that.youtubeLink,
            _that.tags);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            int id,
            @JsonKey(includeToJson: false) String documentRef,
            String title,
            String question,
            String answer,
            Languages lang,
            String? date,
            String? author,
            String? link,
            String? image,
            String? source,
            String? translatedBy,
            String? youtubeLink,
            List<String>? tags)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QandAModel() when $default != null:
        return $default(
            _that.id,
            _that.documentRef,
            _that.title,
            _that.question,
            _that.answer,
            _that.lang,
            _that.date,
            _that.author,
            _that.link,
            _that.image,
            _that.source,
            _that.translatedBy,
            _that.youtubeLink,
            _that.tags);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _QandAModel implements QandAModel {
  _QandAModel(
      {required this.id,
      @JsonKey(includeToJson: false) required this.documentRef,
      required this.title,
      required this.question,
      required this.answer,
      required this.lang,
      this.date,
      this.author,
      this.link,
      this.image,
      this.source,
      this.translatedBy,
      this.youtubeLink,
      final List<String>? tags})
      : _tags = tags;
  factory _QandAModel.fromJson(Map<String, dynamic> json) =>
      _$QandAModelFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(includeToJson: false)
  final String documentRef;
  @override
  final String title;
  @override
  final String question;
  @override
  final String answer;
  @override
  final Languages lang;
  @override
  final String? date;
  @override
  final String? author;
  @override
  final String? link;
  @override
  final String? image;
  @override
  final String? source;
  @override
  final String? translatedBy;
  @override
  final String? youtubeLink;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of QandAModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QandAModelCopyWith<_QandAModel> get copyWith =>
      __$QandAModelCopyWithImpl<_QandAModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QandAModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QandAModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.documentRef, documentRef) ||
                other.documentRef == documentRef) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.translatedBy, translatedBy) ||
                other.translatedBy == translatedBy) &&
            (identical(other.youtubeLink, youtubeLink) ||
                other.youtubeLink == youtubeLink) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      documentRef,
      title,
      question,
      answer,
      lang,
      date,
      author,
      link,
      image,
      source,
      translatedBy,
      youtubeLink,
      const DeepCollectionEquality().hash(_tags));

  @override
  String toString() {
    return 'QandAModel(id: $id, documentRef: $documentRef, title: $title, question: $question, answer: $answer, lang: $lang, date: $date, author: $author, link: $link, image: $image, source: $source, translatedBy: $translatedBy, youtubeLink: $youtubeLink, tags: $tags)';
  }
}

/// @nodoc
abstract mixin class _$QandAModelCopyWith<$Res>
    implements $QandAModelCopyWith<$Res> {
  factory _$QandAModelCopyWith(
          _QandAModel value, $Res Function(_QandAModel) _then) =
      __$QandAModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(includeToJson: false) String documentRef,
      String title,
      String question,
      String answer,
      Languages lang,
      String? date,
      String? author,
      String? link,
      String? image,
      String? source,
      String? translatedBy,
      String? youtubeLink,
      List<String>? tags});
}

/// @nodoc
class __$QandAModelCopyWithImpl<$Res> implements _$QandAModelCopyWith<$Res> {
  __$QandAModelCopyWithImpl(this._self, this._then);

  final _QandAModel _self;
  final $Res Function(_QandAModel) _then;

  /// Create a copy of QandAModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? documentRef = null,
    Object? title = null,
    Object? question = null,
    Object? answer = null,
    Object? lang = null,
    Object? date = freezed,
    Object? author = freezed,
    Object? link = freezed,
    Object? image = freezed,
    Object? source = freezed,
    Object? translatedBy = freezed,
    Object? youtubeLink = freezed,
    Object? tags = freezed,
  }) {
    return _then(_QandAModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      documentRef: null == documentRef
          ? _self.documentRef
          : documentRef // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _self.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _self.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      lang: null == lang
          ? _self.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as Languages,
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _self.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      translatedBy: freezed == translatedBy
          ? _self.translatedBy
          : translatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      youtubeLink: freezed == youtubeLink
          ? _self.youtubeLink
          : youtubeLink // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _self._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

// dart format on
