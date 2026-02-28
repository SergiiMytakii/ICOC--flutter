// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'insights_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InsightsEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InsightsEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'InsightsEvent()';
  }
}

/// @nodoc
class $InsightsEventCopyWith<$Res> {
  $InsightsEventCopyWith(InsightsEvent _, $Res Function(InsightsEvent) __);
}

/// Adds pattern-matching-related methods to [InsightsEvent].
extension InsightsEventPatterns on InsightsEvent {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAvailableLanguagesAndPosts value)?
        fetchAvailableLanguagesAndPosts,
    TResult Function(_LanguagesChanged value)? languagesChanged,
    TResult Function(_ToggleLike value)? toggleLike,
    TResult Function(_ShareTapped value)? shareTapped,
    TResult Function(_RefreshSinglePost value)? refreshSinglePost,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FetchAvailableLanguagesAndPosts()
          when fetchAvailableLanguagesAndPosts != null:
        return fetchAvailableLanguagesAndPosts(_that);
      case _LanguagesChanged() when languagesChanged != null:
        return languagesChanged(_that);
      case _ToggleLike() when toggleLike != null:
        return toggleLike(_that);
      case _ShareTapped() when shareTapped != null:
        return shareTapped(_that);
      case _RefreshSinglePost() when refreshSinglePost != null:
        return refreshSinglePost(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAvailableLanguagesAndPosts value)
        fetchAvailableLanguagesAndPosts,
    required TResult Function(_LanguagesChanged value) languagesChanged,
    required TResult Function(_ToggleLike value) toggleLike,
    required TResult Function(_ShareTapped value) shareTapped,
    required TResult Function(_RefreshSinglePost value) refreshSinglePost,
  }) {
    final _that = this;
    switch (_that) {
      case _FetchAvailableLanguagesAndPosts():
        return fetchAvailableLanguagesAndPosts(_that);
      case _LanguagesChanged():
        return languagesChanged(_that);
      case _ToggleLike():
        return toggleLike(_that);
      case _ShareTapped():
        return shareTapped(_that);
      case _RefreshSinglePost():
        return refreshSinglePost(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAvailableLanguagesAndPosts value)?
        fetchAvailableLanguagesAndPosts,
    TResult? Function(_LanguagesChanged value)? languagesChanged,
    TResult? Function(_ToggleLike value)? toggleLike,
    TResult? Function(_ShareTapped value)? shareTapped,
    TResult? Function(_RefreshSinglePost value)? refreshSinglePost,
  }) {
    final _that = this;
    switch (_that) {
      case _FetchAvailableLanguagesAndPosts()
          when fetchAvailableLanguagesAndPosts != null:
        return fetchAvailableLanguagesAndPosts(_that);
      case _LanguagesChanged() when languagesChanged != null:
        return languagesChanged(_that);
      case _ToggleLike() when toggleLike != null:
        return toggleLike(_that);
      case _ShareTapped() when shareTapped != null:
        return shareTapped(_that);
      case _RefreshSinglePost() when refreshSinglePost != null:
        return refreshSinglePost(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAvailableLanguagesAndPosts,
    TResult Function(Map<String, bool> selectedLanguages)? languagesChanged,
    TResult Function(String postId)? toggleLike,
    TResult Function(String postId)? shareTapped,
    TResult Function(String postId)? refreshSinglePost,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FetchAvailableLanguagesAndPosts()
          when fetchAvailableLanguagesAndPosts != null:
        return fetchAvailableLanguagesAndPosts();
      case _LanguagesChanged() when languagesChanged != null:
        return languagesChanged(_that.selectedLanguages);
      case _ToggleLike() when toggleLike != null:
        return toggleLike(_that.postId);
      case _ShareTapped() when shareTapped != null:
        return shareTapped(_that.postId);
      case _RefreshSinglePost() when refreshSinglePost != null:
        return refreshSinglePost(_that.postId);
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
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAvailableLanguagesAndPosts,
    required TResult Function(Map<String, bool> selectedLanguages)
        languagesChanged,
    required TResult Function(String postId) toggleLike,
    required TResult Function(String postId) shareTapped,
    required TResult Function(String postId) refreshSinglePost,
  }) {
    final _that = this;
    switch (_that) {
      case _FetchAvailableLanguagesAndPosts():
        return fetchAvailableLanguagesAndPosts();
      case _LanguagesChanged():
        return languagesChanged(_that.selectedLanguages);
      case _ToggleLike():
        return toggleLike(_that.postId);
      case _ShareTapped():
        return shareTapped(_that.postId);
      case _RefreshSinglePost():
        return refreshSinglePost(_that.postId);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchAvailableLanguagesAndPosts,
    TResult? Function(Map<String, bool> selectedLanguages)? languagesChanged,
    TResult? Function(String postId)? toggleLike,
    TResult? Function(String postId)? shareTapped,
    TResult? Function(String postId)? refreshSinglePost,
  }) {
    final _that = this;
    switch (_that) {
      case _FetchAvailableLanguagesAndPosts()
          when fetchAvailableLanguagesAndPosts != null:
        return fetchAvailableLanguagesAndPosts();
      case _LanguagesChanged() when languagesChanged != null:
        return languagesChanged(_that.selectedLanguages);
      case _ToggleLike() when toggleLike != null:
        return toggleLike(_that.postId);
      case _ShareTapped() when shareTapped != null:
        return shareTapped(_that.postId);
      case _RefreshSinglePost() when refreshSinglePost != null:
        return refreshSinglePost(_that.postId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FetchAvailableLanguagesAndPosts implements InsightsEvent {
  const _FetchAvailableLanguagesAndPosts();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchAvailableLanguagesAndPosts);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'InsightsEvent.fetchAvailableLanguagesAndPosts()';
  }
}

/// @nodoc

class _LanguagesChanged implements InsightsEvent {
  const _LanguagesChanged(final Map<String, bool> selectedLanguages)
      : _selectedLanguages = selectedLanguages;

  final Map<String, bool> _selectedLanguages;
  Map<String, bool> get selectedLanguages {
    if (_selectedLanguages is EqualUnmodifiableMapView)
      return _selectedLanguages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_selectedLanguages);
  }

  /// Create a copy of InsightsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LanguagesChangedCopyWith<_LanguagesChanged> get copyWith =>
      __$LanguagesChangedCopyWithImpl<_LanguagesChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LanguagesChanged &&
            const DeepCollectionEquality()
                .equals(other._selectedLanguages, _selectedLanguages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_selectedLanguages));

  @override
  String toString() {
    return 'InsightsEvent.languagesChanged(selectedLanguages: $selectedLanguages)';
  }
}

/// @nodoc
abstract mixin class _$LanguagesChangedCopyWith<$Res>
    implements $InsightsEventCopyWith<$Res> {
  factory _$LanguagesChangedCopyWith(
          _LanguagesChanged value, $Res Function(_LanguagesChanged) _then) =
      __$LanguagesChangedCopyWithImpl;
  @useResult
  $Res call({Map<String, bool> selectedLanguages});
}

/// @nodoc
class __$LanguagesChangedCopyWithImpl<$Res>
    implements _$LanguagesChangedCopyWith<$Res> {
  __$LanguagesChangedCopyWithImpl(this._self, this._then);

  final _LanguagesChanged _self;
  final $Res Function(_LanguagesChanged) _then;

  /// Create a copy of InsightsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? selectedLanguages = null,
  }) {
    return _then(_LanguagesChanged(
      null == selectedLanguages
          ? _self._selectedLanguages
          : selectedLanguages // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
    ));
  }
}

/// @nodoc

class _ToggleLike implements InsightsEvent {
  const _ToggleLike(this.postId);

  final String postId;

  /// Create a copy of InsightsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ToggleLikeCopyWith<_ToggleLike> get copyWith =>
      __$ToggleLikeCopyWithImpl<_ToggleLike>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ToggleLike &&
            (identical(other.postId, postId) || other.postId == postId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postId);

  @override
  String toString() {
    return 'InsightsEvent.toggleLike(postId: $postId)';
  }
}

/// @nodoc
abstract mixin class _$ToggleLikeCopyWith<$Res>
    implements $InsightsEventCopyWith<$Res> {
  factory _$ToggleLikeCopyWith(
          _ToggleLike value, $Res Function(_ToggleLike) _then) =
      __$ToggleLikeCopyWithImpl;
  @useResult
  $Res call({String postId});
}

/// @nodoc
class __$ToggleLikeCopyWithImpl<$Res> implements _$ToggleLikeCopyWith<$Res> {
  __$ToggleLikeCopyWithImpl(this._self, this._then);

  final _ToggleLike _self;
  final $Res Function(_ToggleLike) _then;

  /// Create a copy of InsightsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? postId = null,
  }) {
    return _then(_ToggleLike(
      null == postId
          ? _self.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _ShareTapped implements InsightsEvent {
  const _ShareTapped(this.postId);

  final String postId;

  /// Create a copy of InsightsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ShareTappedCopyWith<_ShareTapped> get copyWith =>
      __$ShareTappedCopyWithImpl<_ShareTapped>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShareTapped &&
            (identical(other.postId, postId) || other.postId == postId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postId);

  @override
  String toString() {
    return 'InsightsEvent.shareTapped(postId: $postId)';
  }
}

/// @nodoc
abstract mixin class _$ShareTappedCopyWith<$Res>
    implements $InsightsEventCopyWith<$Res> {
  factory _$ShareTappedCopyWith(
          _ShareTapped value, $Res Function(_ShareTapped) _then) =
      __$ShareTappedCopyWithImpl;
  @useResult
  $Res call({String postId});
}

/// @nodoc
class __$ShareTappedCopyWithImpl<$Res> implements _$ShareTappedCopyWith<$Res> {
  __$ShareTappedCopyWithImpl(this._self, this._then);

  final _ShareTapped _self;
  final $Res Function(_ShareTapped) _then;

  /// Create a copy of InsightsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? postId = null,
  }) {
    return _then(_ShareTapped(
      null == postId
          ? _self.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _RefreshSinglePost implements InsightsEvent {
  const _RefreshSinglePost(this.postId);

  final String postId;

  /// Create a copy of InsightsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RefreshSinglePostCopyWith<_RefreshSinglePost> get copyWith =>
      __$RefreshSinglePostCopyWithImpl<_RefreshSinglePost>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RefreshSinglePost &&
            (identical(other.postId, postId) || other.postId == postId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postId);

  @override
  String toString() {
    return 'InsightsEvent.refreshSinglePost(postId: $postId)';
  }
}

/// @nodoc
abstract mixin class _$RefreshSinglePostCopyWith<$Res>
    implements $InsightsEventCopyWith<$Res> {
  factory _$RefreshSinglePostCopyWith(
          _RefreshSinglePost value, $Res Function(_RefreshSinglePost) _then) =
      __$RefreshSinglePostCopyWithImpl;
  @useResult
  $Res call({String postId});
}

/// @nodoc
class __$RefreshSinglePostCopyWithImpl<$Res>
    implements _$RefreshSinglePostCopyWith<$Res> {
  __$RefreshSinglePostCopyWithImpl(this._self, this._then);

  final _RefreshSinglePost _self;
  final $Res Function(_RefreshSinglePost) _then;

  /// Create a copy of InsightsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? postId = null,
  }) {
    return _then(_RefreshSinglePost(
      null == postId
          ? _self.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
