// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bible_study_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BibleStudyEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() listRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? listRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? listRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BibleStudyListRequested value) listRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BibleStudyListRequested value)? listRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BibleStudyListRequested value)? listRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BibleStudyEventCopyWith<$Res> {
  factory $BibleStudyEventCopyWith(
          BibleStudyEvent value, $Res Function(BibleStudyEvent) then) =
      _$BibleStudyEventCopyWithImpl<$Res, BibleStudyEvent>;
}

/// @nodoc
class _$BibleStudyEventCopyWithImpl<$Res, $Val extends BibleStudyEvent>
    implements $BibleStudyEventCopyWith<$Res> {
  _$BibleStudyEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BibleStudyEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$BibleStudyListRequestedImplCopyWith<$Res> {
  factory _$$BibleStudyListRequestedImplCopyWith(
          _$BibleStudyListRequestedImpl value,
          $Res Function(_$BibleStudyListRequestedImpl) then) =
      __$$BibleStudyListRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BibleStudyListRequestedImplCopyWithImpl<$Res>
    extends _$BibleStudyEventCopyWithImpl<$Res, _$BibleStudyListRequestedImpl>
    implements _$$BibleStudyListRequestedImplCopyWith<$Res> {
  __$$BibleStudyListRequestedImplCopyWithImpl(
      _$BibleStudyListRequestedImpl _value,
      $Res Function(_$BibleStudyListRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of BibleStudyEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$BibleStudyListRequestedImpl implements BibleStudyListRequested {
  const _$BibleStudyListRequestedImpl();

  @override
  String toString() {
    return 'BibleStudyEvent.listRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BibleStudyListRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() listRequested,
  }) {
    return listRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? listRequested,
  }) {
    return listRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? listRequested,
    required TResult orElse(),
  }) {
    if (listRequested != null) {
      return listRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BibleStudyListRequested value) listRequested,
  }) {
    return listRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BibleStudyListRequested value)? listRequested,
  }) {
    return listRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BibleStudyListRequested value)? listRequested,
    required TResult orElse(),
  }) {
    if (listRequested != null) {
      return listRequested(this);
    }
    return orElse();
  }
}

abstract class BibleStudyListRequested implements BibleStudyEvent {
  const factory BibleStudyListRequested() = _$BibleStudyListRequestedImpl;
}

/// @nodoc
mixin _$BibleStudyState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<BibleStudy> topics) success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<BibleStudy> topics)? success,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<BibleStudy> topics)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BibleStudyInitial value) initial,
    required TResult Function(BibleStudyLoadingState value) loading,
    required TResult Function(GetBibleStudyListSuccessState value) success,
    required TResult Function(BibleStudyErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BibleStudyInitial value)? initial,
    TResult? Function(BibleStudyLoadingState value)? loading,
    TResult? Function(GetBibleStudyListSuccessState value)? success,
    TResult? Function(BibleStudyErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BibleStudyInitial value)? initial,
    TResult Function(BibleStudyLoadingState value)? loading,
    TResult Function(GetBibleStudyListSuccessState value)? success,
    TResult Function(BibleStudyErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BibleStudyStateCopyWith<$Res> {
  factory $BibleStudyStateCopyWith(
          BibleStudyState value, $Res Function(BibleStudyState) then) =
      _$BibleStudyStateCopyWithImpl<$Res, BibleStudyState>;
}

/// @nodoc
class _$BibleStudyStateCopyWithImpl<$Res, $Val extends BibleStudyState>
    implements $BibleStudyStateCopyWith<$Res> {
  _$BibleStudyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BibleStudyState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$BibleStudyInitialImplCopyWith<$Res> {
  factory _$$BibleStudyInitialImplCopyWith(_$BibleStudyInitialImpl value,
          $Res Function(_$BibleStudyInitialImpl) then) =
      __$$BibleStudyInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BibleStudyInitialImplCopyWithImpl<$Res>
    extends _$BibleStudyStateCopyWithImpl<$Res, _$BibleStudyInitialImpl>
    implements _$$BibleStudyInitialImplCopyWith<$Res> {
  __$$BibleStudyInitialImplCopyWithImpl(_$BibleStudyInitialImpl _value,
      $Res Function(_$BibleStudyInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of BibleStudyState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$BibleStudyInitialImpl implements BibleStudyInitial {
  const _$BibleStudyInitialImpl();

  @override
  String toString() {
    return 'BibleStudyState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BibleStudyInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<BibleStudy> topics) success,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<BibleStudy> topics)? success,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<BibleStudy> topics)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BibleStudyInitial value) initial,
    required TResult Function(BibleStudyLoadingState value) loading,
    required TResult Function(GetBibleStudyListSuccessState value) success,
    required TResult Function(BibleStudyErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BibleStudyInitial value)? initial,
    TResult? Function(BibleStudyLoadingState value)? loading,
    TResult? Function(GetBibleStudyListSuccessState value)? success,
    TResult? Function(BibleStudyErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BibleStudyInitial value)? initial,
    TResult Function(BibleStudyLoadingState value)? loading,
    TResult Function(GetBibleStudyListSuccessState value)? success,
    TResult Function(BibleStudyErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class BibleStudyInitial implements BibleStudyState {
  const factory BibleStudyInitial() = _$BibleStudyInitialImpl;
}

/// @nodoc
abstract class _$$BibleStudyLoadingStateImplCopyWith<$Res> {
  factory _$$BibleStudyLoadingStateImplCopyWith(
          _$BibleStudyLoadingStateImpl value,
          $Res Function(_$BibleStudyLoadingStateImpl) then) =
      __$$BibleStudyLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BibleStudyLoadingStateImplCopyWithImpl<$Res>
    extends _$BibleStudyStateCopyWithImpl<$Res, _$BibleStudyLoadingStateImpl>
    implements _$$BibleStudyLoadingStateImplCopyWith<$Res> {
  __$$BibleStudyLoadingStateImplCopyWithImpl(
      _$BibleStudyLoadingStateImpl _value,
      $Res Function(_$BibleStudyLoadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BibleStudyState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$BibleStudyLoadingStateImpl implements BibleStudyLoadingState {
  const _$BibleStudyLoadingStateImpl();

  @override
  String toString() {
    return 'BibleStudyState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BibleStudyLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<BibleStudy> topics) success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<BibleStudy> topics)? success,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<BibleStudy> topics)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BibleStudyInitial value) initial,
    required TResult Function(BibleStudyLoadingState value) loading,
    required TResult Function(GetBibleStudyListSuccessState value) success,
    required TResult Function(BibleStudyErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BibleStudyInitial value)? initial,
    TResult? Function(BibleStudyLoadingState value)? loading,
    TResult? Function(GetBibleStudyListSuccessState value)? success,
    TResult? Function(BibleStudyErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BibleStudyInitial value)? initial,
    TResult Function(BibleStudyLoadingState value)? loading,
    TResult Function(GetBibleStudyListSuccessState value)? success,
    TResult Function(BibleStudyErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class BibleStudyLoadingState implements BibleStudyState {
  const factory BibleStudyLoadingState() = _$BibleStudyLoadingStateImpl;
}

/// @nodoc
abstract class _$$GetBibleStudyListSuccessStateImplCopyWith<$Res> {
  factory _$$GetBibleStudyListSuccessStateImplCopyWith(
          _$GetBibleStudyListSuccessStateImpl value,
          $Res Function(_$GetBibleStudyListSuccessStateImpl) then) =
      __$$GetBibleStudyListSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<BibleStudy> topics});
}

/// @nodoc
class __$$GetBibleStudyListSuccessStateImplCopyWithImpl<$Res>
    extends _$BibleStudyStateCopyWithImpl<$Res,
        _$GetBibleStudyListSuccessStateImpl>
    implements _$$GetBibleStudyListSuccessStateImplCopyWith<$Res> {
  __$$GetBibleStudyListSuccessStateImplCopyWithImpl(
      _$GetBibleStudyListSuccessStateImpl _value,
      $Res Function(_$GetBibleStudyListSuccessStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BibleStudyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topics = null,
  }) {
    return _then(_$GetBibleStudyListSuccessStateImpl(
      null == topics
          ? _value._topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<BibleStudy>,
    ));
  }
}

/// @nodoc

class _$GetBibleStudyListSuccessStateImpl
    implements GetBibleStudyListSuccessState {
  const _$GetBibleStudyListSuccessStateImpl(final List<BibleStudy> topics)
      : _topics = topics;

  final List<BibleStudy> _topics;
  @override
  List<BibleStudy> get topics {
    if (_topics is EqualUnmodifiableListView) return _topics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topics);
  }

  @override
  String toString() {
    return 'BibleStudyState.success(topics: $topics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetBibleStudyListSuccessStateImpl &&
            const DeepCollectionEquality().equals(other._topics, _topics));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_topics));

  /// Create a copy of BibleStudyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetBibleStudyListSuccessStateImplCopyWith<
          _$GetBibleStudyListSuccessStateImpl>
      get copyWith => __$$GetBibleStudyListSuccessStateImplCopyWithImpl<
          _$GetBibleStudyListSuccessStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<BibleStudy> topics) success,
    required TResult Function(String message) error,
  }) {
    return success(topics);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<BibleStudy> topics)? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call(topics);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<BibleStudy> topics)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(topics);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BibleStudyInitial value) initial,
    required TResult Function(BibleStudyLoadingState value) loading,
    required TResult Function(GetBibleStudyListSuccessState value) success,
    required TResult Function(BibleStudyErrorState value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BibleStudyInitial value)? initial,
    TResult? Function(BibleStudyLoadingState value)? loading,
    TResult? Function(GetBibleStudyListSuccessState value)? success,
    TResult? Function(BibleStudyErrorState value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BibleStudyInitial value)? initial,
    TResult Function(BibleStudyLoadingState value)? loading,
    TResult Function(GetBibleStudyListSuccessState value)? success,
    TResult Function(BibleStudyErrorState value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class GetBibleStudyListSuccessState implements BibleStudyState {
  const factory GetBibleStudyListSuccessState(final List<BibleStudy> topics) =
      _$GetBibleStudyListSuccessStateImpl;

  List<BibleStudy> get topics;

  /// Create a copy of BibleStudyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetBibleStudyListSuccessStateImplCopyWith<
          _$GetBibleStudyListSuccessStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BibleStudyErrorStateImplCopyWith<$Res> {
  factory _$$BibleStudyErrorStateImplCopyWith(_$BibleStudyErrorStateImpl value,
          $Res Function(_$BibleStudyErrorStateImpl) then) =
      __$$BibleStudyErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$BibleStudyErrorStateImplCopyWithImpl<$Res>
    extends _$BibleStudyStateCopyWithImpl<$Res, _$BibleStudyErrorStateImpl>
    implements _$$BibleStudyErrorStateImplCopyWith<$Res> {
  __$$BibleStudyErrorStateImplCopyWithImpl(_$BibleStudyErrorStateImpl _value,
      $Res Function(_$BibleStudyErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BibleStudyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$BibleStudyErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BibleStudyErrorStateImpl implements BibleStudyErrorState {
  const _$BibleStudyErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'BibleStudyState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BibleStudyErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of BibleStudyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BibleStudyErrorStateImplCopyWith<_$BibleStudyErrorStateImpl>
      get copyWith =>
          __$$BibleStudyErrorStateImplCopyWithImpl<_$BibleStudyErrorStateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<BibleStudy> topics) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<BibleStudy> topics)? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<BibleStudy> topics)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BibleStudyInitial value) initial,
    required TResult Function(BibleStudyLoadingState value) loading,
    required TResult Function(GetBibleStudyListSuccessState value) success,
    required TResult Function(BibleStudyErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BibleStudyInitial value)? initial,
    TResult? Function(BibleStudyLoadingState value)? loading,
    TResult? Function(GetBibleStudyListSuccessState value)? success,
    TResult? Function(BibleStudyErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BibleStudyInitial value)? initial,
    TResult Function(BibleStudyLoadingState value)? loading,
    TResult Function(GetBibleStudyListSuccessState value)? success,
    TResult Function(BibleStudyErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class BibleStudyErrorState implements BibleStudyState {
  const factory BibleStudyErrorState(final String message) =
      _$BibleStudyErrorStateImpl;

  String get message;

  /// Create a copy of BibleStudyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BibleStudyErrorStateImplCopyWith<_$BibleStudyErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
