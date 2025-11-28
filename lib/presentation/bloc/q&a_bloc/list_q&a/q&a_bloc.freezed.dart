// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'q&a_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QandAEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is QandAEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'QandAEvent()';
  }
}

/// @nodoc
class $QandAEventCopyWith<$Res> {
  $QandAEventCopyWith(QandAEvent _, $Res Function(QandAEvent) __);
}

/// Adds pattern-matching-related methods to [QandAEvent].
extension QandAEventPatterns on QandAEvent {
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
    TResult Function(QandARequested value)? requested,
    TResult Function(QandGetLangs value)? getLangs,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case QandARequested() when requested != null:
        return requested(_that);
      case QandGetLangs() when getLangs != null:
        return getLangs(_that);
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
    required TResult Function(QandARequested value) requested,
    required TResult Function(QandGetLangs value) getLangs,
  }) {
    final _that = this;
    switch (_that) {
      case QandARequested():
        return requested(_that);
      case QandGetLangs():
        return getLangs(_that);
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
    TResult? Function(QandARequested value)? requested,
    TResult? Function(QandGetLangs value)? getLangs,
  }) {
    final _that = this;
    switch (_that) {
      case QandARequested() when requested != null:
        return requested(_that);
      case QandGetLangs() when getLangs != null:
        return getLangs(_that);
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
    TResult Function(String? query, OrderEnum? order)? requested,
    TResult Function()? getLangs,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case QandARequested() when requested != null:
        return requested(_that.query, _that.order);
      case QandGetLangs() when getLangs != null:
        return getLangs();
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
    required TResult Function(String? query, OrderEnum? order) requested,
    required TResult Function() getLangs,
  }) {
    final _that = this;
    switch (_that) {
      case QandARequested():
        return requested(_that.query, _that.order);
      case QandGetLangs():
        return getLangs();
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
    TResult? Function(String? query, OrderEnum? order)? requested,
    TResult? Function()? getLangs,
  }) {
    final _that = this;
    switch (_that) {
      case QandARequested() when requested != null:
        return requested(_that.query, _that.order);
      case QandGetLangs() when getLangs != null:
        return getLangs();
      case _:
        return null;
    }
  }
}

/// @nodoc

class QandARequested implements QandAEvent {
  const QandARequested({this.query, this.order});

  final String? query;
  final OrderEnum? order;

  /// Create a copy of QandAEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QandARequestedCopyWith<QandARequested> get copyWith =>
      _$QandARequestedCopyWithImpl<QandARequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QandARequested &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.order, order) || other.order == order));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, order);

  @override
  String toString() {
    return 'QandAEvent.requested(query: $query, order: $order)';
  }
}

/// @nodoc
abstract mixin class $QandARequestedCopyWith<$Res>
    implements $QandAEventCopyWith<$Res> {
  factory $QandARequestedCopyWith(
          QandARequested value, $Res Function(QandARequested) _then) =
      _$QandARequestedCopyWithImpl;
  @useResult
  $Res call({String? query, OrderEnum? order});
}

/// @nodoc
class _$QandARequestedCopyWithImpl<$Res>
    implements $QandARequestedCopyWith<$Res> {
  _$QandARequestedCopyWithImpl(this._self, this._then);

  final QandARequested _self;
  final $Res Function(QandARequested) _then;

  /// Create a copy of QandAEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = freezed,
    Object? order = freezed,
  }) {
    return _then(QandARequested(
      query: freezed == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _self.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderEnum?,
    ));
  }
}

/// @nodoc

class QandGetLangs implements QandAEvent {
  const QandGetLangs();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is QandGetLangs);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'QandAEvent.getLangs()';
  }
}

/// @nodoc
mixin _$QandAState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is QandAState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'QandAState()';
  }
}

/// @nodoc
class $QandAStateCopyWith<$Res> {
  $QandAStateCopyWith(QandAState _, $Res Function(QandAState) __);
}

/// Adds pattern-matching-related methods to [QandAState].
extension QandAStatePatterns on QandAState {
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
    TResult Function(QandAInitialState value)? initial,
    TResult Function(QandALoadingState value)? loading,
    TResult Function(QandAEmptyState value)? empty,
    TResult Function(GetQandASuccessState value)? success,
    TResult Function(SearchQandASuccessState value)? searchSuccess,
    TResult Function(QandAErrorState value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case QandAInitialState() when initial != null:
        return initial(_that);
      case QandALoadingState() when loading != null:
        return loading(_that);
      case QandAEmptyState() when empty != null:
        return empty(_that);
      case GetQandASuccessState() when success != null:
        return success(_that);
      case SearchQandASuccessState() when searchSuccess != null:
        return searchSuccess(_that);
      case QandAErrorState() when error != null:
        return error(_that);
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
    required TResult Function(QandAInitialState value) initial,
    required TResult Function(QandALoadingState value) loading,
    required TResult Function(QandAEmptyState value) empty,
    required TResult Function(GetQandASuccessState value) success,
    required TResult Function(SearchQandASuccessState value) searchSuccess,
    required TResult Function(QandAErrorState value) error,
  }) {
    final _that = this;
    switch (_that) {
      case QandAInitialState():
        return initial(_that);
      case QandALoadingState():
        return loading(_that);
      case QandAEmptyState():
        return empty(_that);
      case GetQandASuccessState():
        return success(_that);
      case SearchQandASuccessState():
        return searchSuccess(_that);
      case QandAErrorState():
        return error(_that);
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
    TResult? Function(QandAInitialState value)? initial,
    TResult? Function(QandALoadingState value)? loading,
    TResult? Function(QandAEmptyState value)? empty,
    TResult? Function(GetQandASuccessState value)? success,
    TResult? Function(SearchQandASuccessState value)? searchSuccess,
    TResult? Function(QandAErrorState value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case QandAInitialState() when initial != null:
        return initial(_that);
      case QandALoadingState() when loading != null:
        return loading(_that);
      case QandAEmptyState() when empty != null:
        return empty(_that);
      case GetQandASuccessState() when success != null:
        return success(_that);
      case SearchQandASuccessState() when searchSuccess != null:
        return searchSuccess(_that);
      case QandAErrorState() when error != null:
        return error(_that);
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
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(List<QandAModel> articles)? success,
    TResult Function(List<QandAModel> articles)? searchSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case QandAInitialState() when initial != null:
        return initial();
      case QandALoadingState() when loading != null:
        return loading();
      case QandAEmptyState() when empty != null:
        return empty();
      case GetQandASuccessState() when success != null:
        return success(_that.articles);
      case SearchQandASuccessState() when searchSuccess != null:
        return searchSuccess(_that.articles);
      case QandAErrorState() when error != null:
        return error(_that.message);
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
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(List<QandAModel> articles) success,
    required TResult Function(List<QandAModel> articles) searchSuccess,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case QandAInitialState():
        return initial();
      case QandALoadingState():
        return loading();
      case QandAEmptyState():
        return empty();
      case GetQandASuccessState():
        return success(_that.articles);
      case SearchQandASuccessState():
        return searchSuccess(_that.articles);
      case QandAErrorState():
        return error(_that.message);
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
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(List<QandAModel> articles)? success,
    TResult? Function(List<QandAModel> articles)? searchSuccess,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case QandAInitialState() when initial != null:
        return initial();
      case QandALoadingState() when loading != null:
        return loading();
      case QandAEmptyState() when empty != null:
        return empty();
      case GetQandASuccessState() when success != null:
        return success(_that.articles);
      case SearchQandASuccessState() when searchSuccess != null:
        return searchSuccess(_that.articles);
      case QandAErrorState() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class QandAInitialState implements QandAState {
  const QandAInitialState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is QandAInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'QandAState.initial()';
  }
}

/// @nodoc

class QandALoadingState implements QandAState {
  const QandALoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is QandALoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'QandAState.loading()';
  }
}

/// @nodoc

class QandAEmptyState implements QandAState {
  const QandAEmptyState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is QandAEmptyState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'QandAState.empty()';
  }
}

/// @nodoc

class GetQandASuccessState implements QandAState {
  const GetQandASuccessState(final List<QandAModel> articles)
      : _articles = articles;

  final List<QandAModel> _articles;
  List<QandAModel> get articles {
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articles);
  }

  /// Create a copy of QandAState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetQandASuccessStateCopyWith<GetQandASuccessState> get copyWith =>
      _$GetQandASuccessStateCopyWithImpl<GetQandASuccessState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetQandASuccessState &&
            const DeepCollectionEquality().equals(other._articles, _articles));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_articles));

  @override
  String toString() {
    return 'QandAState.success(articles: $articles)';
  }
}

/// @nodoc
abstract mixin class $GetQandASuccessStateCopyWith<$Res>
    implements $QandAStateCopyWith<$Res> {
  factory $GetQandASuccessStateCopyWith(GetQandASuccessState value,
          $Res Function(GetQandASuccessState) _then) =
      _$GetQandASuccessStateCopyWithImpl;
  @useResult
  $Res call({List<QandAModel> articles});
}

/// @nodoc
class _$GetQandASuccessStateCopyWithImpl<$Res>
    implements $GetQandASuccessStateCopyWith<$Res> {
  _$GetQandASuccessStateCopyWithImpl(this._self, this._then);

  final GetQandASuccessState _self;
  final $Res Function(GetQandASuccessState) _then;

  /// Create a copy of QandAState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? articles = null,
  }) {
    return _then(GetQandASuccessState(
      null == articles
          ? _self._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<QandAModel>,
    ));
  }
}

/// @nodoc

class SearchQandASuccessState implements QandAState {
  const SearchQandASuccessState(final List<QandAModel> articles)
      : _articles = articles;

  final List<QandAModel> _articles;
  List<QandAModel> get articles {
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articles);
  }

  /// Create a copy of QandAState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchQandASuccessStateCopyWith<SearchQandASuccessState> get copyWith =>
      _$SearchQandASuccessStateCopyWithImpl<SearchQandASuccessState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchQandASuccessState &&
            const DeepCollectionEquality().equals(other._articles, _articles));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_articles));

  @override
  String toString() {
    return 'QandAState.searchSuccess(articles: $articles)';
  }
}

/// @nodoc
abstract mixin class $SearchQandASuccessStateCopyWith<$Res>
    implements $QandAStateCopyWith<$Res> {
  factory $SearchQandASuccessStateCopyWith(SearchQandASuccessState value,
          $Res Function(SearchQandASuccessState) _then) =
      _$SearchQandASuccessStateCopyWithImpl;
  @useResult
  $Res call({List<QandAModel> articles});
}

/// @nodoc
class _$SearchQandASuccessStateCopyWithImpl<$Res>
    implements $SearchQandASuccessStateCopyWith<$Res> {
  _$SearchQandASuccessStateCopyWithImpl(this._self, this._then);

  final SearchQandASuccessState _self;
  final $Res Function(SearchQandASuccessState) _then;

  /// Create a copy of QandAState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? articles = null,
  }) {
    return _then(SearchQandASuccessState(
      null == articles
          ? _self._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<QandAModel>,
    ));
  }
}

/// @nodoc

class QandAErrorState implements QandAState {
  const QandAErrorState(this.message);

  final String message;

  /// Create a copy of QandAState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QandAErrorStateCopyWith<QandAErrorState> get copyWith =>
      _$QandAErrorStateCopyWithImpl<QandAErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QandAErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'QandAState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $QandAErrorStateCopyWith<$Res>
    implements $QandAStateCopyWith<$Res> {
  factory $QandAErrorStateCopyWith(
          QandAErrorState value, $Res Function(QandAErrorState) _then) =
      _$QandAErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$QandAErrorStateCopyWithImpl<$Res>
    implements $QandAErrorStateCopyWith<$Res> {
  _$QandAErrorStateCopyWithImpl(this._self, this._then);

  final QandAErrorState _self;
  final $Res Function(QandAErrorState) _then;

  /// Create a copy of QandAState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(QandAErrorState(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
