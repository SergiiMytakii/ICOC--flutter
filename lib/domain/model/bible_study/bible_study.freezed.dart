// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bible_study.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BibleStudy {
  String get topic;
  String get subtopic;
  Languages get lang;
  int get id;
  List<Lesson> get lessons;

  /// Create a copy of BibleStudy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BibleStudyCopyWith<BibleStudy> get copyWith =>
      _$BibleStudyCopyWithImpl<BibleStudy>(this as BibleStudy, _$identity);

  /// Serializes this BibleStudy to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BibleStudy &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.subtopic, subtopic) ||
                other.subtopic == subtopic) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.lessons, lessons));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, topic, subtopic, lang, id,
      const DeepCollectionEquality().hash(lessons));

  @override
  String toString() {
    return 'BibleStudy(topic: $topic, subtopic: $subtopic, lang: $lang, id: $id, lessons: $lessons)';
  }
}

/// @nodoc
abstract mixin class $BibleStudyCopyWith<$Res> {
  factory $BibleStudyCopyWith(
          BibleStudy value, $Res Function(BibleStudy) _then) =
      _$BibleStudyCopyWithImpl;
  @useResult
  $Res call(
      {String topic,
      String subtopic,
      Languages lang,
      int id,
      List<Lesson> lessons});
}

/// @nodoc
class _$BibleStudyCopyWithImpl<$Res> implements $BibleStudyCopyWith<$Res> {
  _$BibleStudyCopyWithImpl(this._self, this._then);

  final BibleStudy _self;
  final $Res Function(BibleStudy) _then;

  /// Create a copy of BibleStudy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topic = null,
    Object? subtopic = null,
    Object? lang = null,
    Object? id = null,
    Object? lessons = null,
  }) {
    return _then(_self.copyWith(
      topic: null == topic
          ? _self.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      subtopic: null == subtopic
          ? _self.subtopic
          : subtopic // ignore: cast_nullable_to_non_nullable
              as String,
      lang: null == lang
          ? _self.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as Languages,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      lessons: null == lessons
          ? _self.lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<Lesson>,
    ));
  }
}

/// Adds pattern-matching-related methods to [BibleStudy].
extension BibleStudyPatterns on BibleStudy {
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
    TResult Function(_BibleStudy value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BibleStudy() when $default != null:
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
    TResult Function(_BibleStudy value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BibleStudy():
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
    TResult? Function(_BibleStudy value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BibleStudy() when $default != null:
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
    TResult Function(String topic, String subtopic, Languages lang, int id,
            List<Lesson> lessons)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BibleStudy() when $default != null:
        return $default(
            _that.topic, _that.subtopic, _that.lang, _that.id, _that.lessons);
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
    TResult Function(String topic, String subtopic, Languages lang, int id,
            List<Lesson> lessons)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BibleStudy():
        return $default(
            _that.topic, _that.subtopic, _that.lang, _that.id, _that.lessons);
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
    TResult? Function(String topic, String subtopic, Languages lang, int id,
            List<Lesson> lessons)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BibleStudy() when $default != null:
        return $default(
            _that.topic, _that.subtopic, _that.lang, _that.id, _that.lessons);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _BibleStudy implements BibleStudy {
  const _BibleStudy(
      {required this.topic,
      required this.subtopic,
      required this.lang,
      required this.id,
      required final List<Lesson> lessons})
      : _lessons = lessons;
  factory _BibleStudy.fromJson(Map<String, dynamic> json) =>
      _$BibleStudyFromJson(json);

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

  /// Create a copy of BibleStudy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BibleStudyCopyWith<_BibleStudy> get copyWith =>
      __$BibleStudyCopyWithImpl<_BibleStudy>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BibleStudyToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BibleStudy &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.subtopic, subtopic) ||
                other.subtopic == subtopic) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._lessons, _lessons));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, topic, subtopic, lang, id,
      const DeepCollectionEquality().hash(_lessons));

  @override
  String toString() {
    return 'BibleStudy(topic: $topic, subtopic: $subtopic, lang: $lang, id: $id, lessons: $lessons)';
  }
}

/// @nodoc
abstract mixin class _$BibleStudyCopyWith<$Res>
    implements $BibleStudyCopyWith<$Res> {
  factory _$BibleStudyCopyWith(
          _BibleStudy value, $Res Function(_BibleStudy) _then) =
      __$BibleStudyCopyWithImpl;
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
class __$BibleStudyCopyWithImpl<$Res> implements _$BibleStudyCopyWith<$Res> {
  __$BibleStudyCopyWithImpl(this._self, this._then);

  final _BibleStudy _self;
  final $Res Function(_BibleStudy) _then;

  /// Create a copy of BibleStudy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? topic = null,
    Object? subtopic = null,
    Object? lang = null,
    Object? id = null,
    Object? lessons = null,
  }) {
    return _then(_BibleStudy(
      topic: null == topic
          ? _self.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      subtopic: null == subtopic
          ? _self.subtopic
          : subtopic // ignore: cast_nullable_to_non_nullable
              as String,
      lang: null == lang
          ? _self.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as Languages,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      lessons: null == lessons
          ? _self._lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<Lesson>,
    ));
  }
}

/// @nodoc
mixin _$Lesson {
  int get id;
  String get title;
  String get text;

  /// Create a copy of Lesson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LessonCopyWith<Lesson> get copyWith =>
      _$LessonCopyWithImpl<Lesson>(this as Lesson, _$identity);

  /// Serializes this Lesson to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Lesson &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, text);

  @override
  String toString() {
    return 'Lesson(id: $id, title: $title, text: $text)';
  }
}

/// @nodoc
abstract mixin class $LessonCopyWith<$Res> {
  factory $LessonCopyWith(Lesson value, $Res Function(Lesson) _then) =
      _$LessonCopyWithImpl;
  @useResult
  $Res call({int id, String title, String text});
}

/// @nodoc
class _$LessonCopyWithImpl<$Res> implements $LessonCopyWith<$Res> {
  _$LessonCopyWithImpl(this._self, this._then);

  final Lesson _self;
  final $Res Function(Lesson) _then;

  /// Create a copy of Lesson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? text = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [Lesson].
extension LessonPatterns on Lesson {
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
    TResult Function(_Lesson value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Lesson() when $default != null:
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
    TResult Function(_Lesson value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Lesson():
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
    TResult? Function(_Lesson value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Lesson() when $default != null:
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
    TResult Function(int id, String title, String text)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Lesson() when $default != null:
        return $default(_that.id, _that.title, _that.text);
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
    TResult Function(int id, String title, String text) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Lesson():
        return $default(_that.id, _that.title, _that.text);
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
    TResult? Function(int id, String title, String text)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Lesson() when $default != null:
        return $default(_that.id, _that.title, _that.text);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Lesson implements Lesson {
  const _Lesson({required this.id, required this.title, required this.text});
  factory _Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String text;

  /// Create a copy of Lesson
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LessonCopyWith<_Lesson> get copyWith =>
      __$LessonCopyWithImpl<_Lesson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LessonToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Lesson &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, text);

  @override
  String toString() {
    return 'Lesson(id: $id, title: $title, text: $text)';
  }
}

/// @nodoc
abstract mixin class _$LessonCopyWith<$Res> implements $LessonCopyWith<$Res> {
  factory _$LessonCopyWith(_Lesson value, $Res Function(_Lesson) _then) =
      __$LessonCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String title, String text});
}

/// @nodoc
class __$LessonCopyWithImpl<$Res> implements _$LessonCopyWith<$Res> {
  __$LessonCopyWithImpl(this._self, this._then);

  final _Lesson _self;
  final $Res Function(_Lesson) _then;

  /// Create a copy of Lesson
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? text = null,
  }) {
    return _then(_Lesson(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
