// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FeedbackEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() listRequested,
    required TResult Function(String feedback, String name) insertRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? listRequested,
    TResult? Function(String feedback, String name)? insertRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? listRequested,
    TResult Function(String feedback, String name)? insertRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FeedbackListRequested value) listRequested,
    required TResult Function(InsertFeedbackRequested value) insertRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FeedbackListRequested value)? listRequested,
    TResult? Function(InsertFeedbackRequested value)? insertRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FeedbackListRequested value)? listRequested,
    TResult Function(InsertFeedbackRequested value)? insertRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackEventCopyWith<$Res> {
  factory $FeedbackEventCopyWith(
          FeedbackEvent value, $Res Function(FeedbackEvent) then) =
      _$FeedbackEventCopyWithImpl<$Res, FeedbackEvent>;
}

/// @nodoc
class _$FeedbackEventCopyWithImpl<$Res, $Val extends FeedbackEvent>
    implements $FeedbackEventCopyWith<$Res> {
  _$FeedbackEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FeedbackListRequestedImplCopyWith<$Res> {
  factory _$$FeedbackListRequestedImplCopyWith(
          _$FeedbackListRequestedImpl value,
          $Res Function(_$FeedbackListRequestedImpl) then) =
      __$$FeedbackListRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FeedbackListRequestedImplCopyWithImpl<$Res>
    extends _$FeedbackEventCopyWithImpl<$Res, _$FeedbackListRequestedImpl>
    implements _$$FeedbackListRequestedImplCopyWith<$Res> {
  __$$FeedbackListRequestedImplCopyWithImpl(_$FeedbackListRequestedImpl _value,
      $Res Function(_$FeedbackListRequestedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FeedbackListRequestedImpl implements FeedbackListRequested {
  const _$FeedbackListRequestedImpl();

  @override
  String toString() {
    return 'FeedbackEvent.listRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedbackListRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() listRequested,
    required TResult Function(String feedback, String name) insertRequested,
  }) {
    return listRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? listRequested,
    TResult? Function(String feedback, String name)? insertRequested,
  }) {
    return listRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? listRequested,
    TResult Function(String feedback, String name)? insertRequested,
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
    required TResult Function(FeedbackListRequested value) listRequested,
    required TResult Function(InsertFeedbackRequested value) insertRequested,
  }) {
    return listRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FeedbackListRequested value)? listRequested,
    TResult? Function(InsertFeedbackRequested value)? insertRequested,
  }) {
    return listRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FeedbackListRequested value)? listRequested,
    TResult Function(InsertFeedbackRequested value)? insertRequested,
    required TResult orElse(),
  }) {
    if (listRequested != null) {
      return listRequested(this);
    }
    return orElse();
  }
}

abstract class FeedbackListRequested implements FeedbackEvent {
  const factory FeedbackListRequested() = _$FeedbackListRequestedImpl;
}

/// @nodoc
abstract class _$$InsertFeedbackRequestedImplCopyWith<$Res> {
  factory _$$InsertFeedbackRequestedImplCopyWith(
          _$InsertFeedbackRequestedImpl value,
          $Res Function(_$InsertFeedbackRequestedImpl) then) =
      __$$InsertFeedbackRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String feedback, String name});
}

/// @nodoc
class __$$InsertFeedbackRequestedImplCopyWithImpl<$Res>
    extends _$FeedbackEventCopyWithImpl<$Res, _$InsertFeedbackRequestedImpl>
    implements _$$InsertFeedbackRequestedImplCopyWith<$Res> {
  __$$InsertFeedbackRequestedImplCopyWithImpl(
      _$InsertFeedbackRequestedImpl _value,
      $Res Function(_$InsertFeedbackRequestedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feedback = null,
    Object? name = null,
  }) {
    return _then(_$InsertFeedbackRequestedImpl(
      feedback: null == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InsertFeedbackRequestedImpl implements InsertFeedbackRequested {
  const _$InsertFeedbackRequestedImpl(
      {required this.feedback, required this.name});

  @override
  final String feedback;
  @override
  final String name;

  @override
  String toString() {
    return 'FeedbackEvent.insertRequested(feedback: $feedback, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InsertFeedbackRequestedImpl &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, feedback, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InsertFeedbackRequestedImplCopyWith<_$InsertFeedbackRequestedImpl>
      get copyWith => __$$InsertFeedbackRequestedImplCopyWithImpl<
          _$InsertFeedbackRequestedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() listRequested,
    required TResult Function(String feedback, String name) insertRequested,
  }) {
    return insertRequested(feedback, name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? listRequested,
    TResult? Function(String feedback, String name)? insertRequested,
  }) {
    return insertRequested?.call(feedback, name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? listRequested,
    TResult Function(String feedback, String name)? insertRequested,
    required TResult orElse(),
  }) {
    if (insertRequested != null) {
      return insertRequested(feedback, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FeedbackListRequested value) listRequested,
    required TResult Function(InsertFeedbackRequested value) insertRequested,
  }) {
    return insertRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FeedbackListRequested value)? listRequested,
    TResult? Function(InsertFeedbackRequested value)? insertRequested,
  }) {
    return insertRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FeedbackListRequested value)? listRequested,
    TResult Function(InsertFeedbackRequested value)? insertRequested,
    required TResult orElse(),
  }) {
    if (insertRequested != null) {
      return insertRequested(this);
    }
    return orElse();
  }
}

abstract class InsertFeedbackRequested implements FeedbackEvent {
  const factory InsertFeedbackRequested(
      {required final String feedback,
      required final String name}) = _$InsertFeedbackRequestedImpl;

  String get feedback;
  String get name;
  @JsonKey(ignore: true)
  _$$InsertFeedbackRequestedImplCopyWith<_$InsertFeedbackRequestedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FeedbackState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<FeedbackModel> feedbacks)
        getFeedbackListSuccess,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<FeedbackModel> feedbacks)? getFeedbackListSuccess,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<FeedbackModel> feedbacks)? getFeedbackListSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FeedbackInitial value) initial,
    required TResult Function(FeedbackLoadingState value) loading,
    required TResult Function(GetFeedbackListSuccessState value)
        getFeedbackListSuccess,
    required TResult Function(FeedbackErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FeedbackInitial value)? initial,
    TResult? Function(FeedbackLoadingState value)? loading,
    TResult? Function(GetFeedbackListSuccessState value)?
        getFeedbackListSuccess,
    TResult? Function(FeedbackErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FeedbackInitial value)? initial,
    TResult Function(FeedbackLoadingState value)? loading,
    TResult Function(GetFeedbackListSuccessState value)? getFeedbackListSuccess,
    TResult Function(FeedbackErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackStateCopyWith<$Res> {
  factory $FeedbackStateCopyWith(
          FeedbackState value, $Res Function(FeedbackState) then) =
      _$FeedbackStateCopyWithImpl<$Res, FeedbackState>;
}

/// @nodoc
class _$FeedbackStateCopyWithImpl<$Res, $Val extends FeedbackState>
    implements $FeedbackStateCopyWith<$Res> {
  _$FeedbackStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FeedbackInitialImplCopyWith<$Res> {
  factory _$$FeedbackInitialImplCopyWith(_$FeedbackInitialImpl value,
          $Res Function(_$FeedbackInitialImpl) then) =
      __$$FeedbackInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FeedbackInitialImplCopyWithImpl<$Res>
    extends _$FeedbackStateCopyWithImpl<$Res, _$FeedbackInitialImpl>
    implements _$$FeedbackInitialImplCopyWith<$Res> {
  __$$FeedbackInitialImplCopyWithImpl(
      _$FeedbackInitialImpl _value, $Res Function(_$FeedbackInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FeedbackInitialImpl implements FeedbackInitial {
  const _$FeedbackInitialImpl();

  @override
  String toString() {
    return 'FeedbackState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FeedbackInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<FeedbackModel> feedbacks)
        getFeedbackListSuccess,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<FeedbackModel> feedbacks)? getFeedbackListSuccess,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<FeedbackModel> feedbacks)? getFeedbackListSuccess,
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
    required TResult Function(FeedbackInitial value) initial,
    required TResult Function(FeedbackLoadingState value) loading,
    required TResult Function(GetFeedbackListSuccessState value)
        getFeedbackListSuccess,
    required TResult Function(FeedbackErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FeedbackInitial value)? initial,
    TResult? Function(FeedbackLoadingState value)? loading,
    TResult? Function(GetFeedbackListSuccessState value)?
        getFeedbackListSuccess,
    TResult? Function(FeedbackErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FeedbackInitial value)? initial,
    TResult Function(FeedbackLoadingState value)? loading,
    TResult Function(GetFeedbackListSuccessState value)? getFeedbackListSuccess,
    TResult Function(FeedbackErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class FeedbackInitial implements FeedbackState {
  const factory FeedbackInitial() = _$FeedbackInitialImpl;
}

/// @nodoc
abstract class _$$FeedbackLoadingStateImplCopyWith<$Res> {
  factory _$$FeedbackLoadingStateImplCopyWith(_$FeedbackLoadingStateImpl value,
          $Res Function(_$FeedbackLoadingStateImpl) then) =
      __$$FeedbackLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FeedbackLoadingStateImplCopyWithImpl<$Res>
    extends _$FeedbackStateCopyWithImpl<$Res, _$FeedbackLoadingStateImpl>
    implements _$$FeedbackLoadingStateImplCopyWith<$Res> {
  __$$FeedbackLoadingStateImplCopyWithImpl(_$FeedbackLoadingStateImpl _value,
      $Res Function(_$FeedbackLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FeedbackLoadingStateImpl implements FeedbackLoadingState {
  const _$FeedbackLoadingStateImpl();

  @override
  String toString() {
    return 'FeedbackState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedbackLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<FeedbackModel> feedbacks)
        getFeedbackListSuccess,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<FeedbackModel> feedbacks)? getFeedbackListSuccess,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<FeedbackModel> feedbacks)? getFeedbackListSuccess,
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
    required TResult Function(FeedbackInitial value) initial,
    required TResult Function(FeedbackLoadingState value) loading,
    required TResult Function(GetFeedbackListSuccessState value)
        getFeedbackListSuccess,
    required TResult Function(FeedbackErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FeedbackInitial value)? initial,
    TResult? Function(FeedbackLoadingState value)? loading,
    TResult? Function(GetFeedbackListSuccessState value)?
        getFeedbackListSuccess,
    TResult? Function(FeedbackErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FeedbackInitial value)? initial,
    TResult Function(FeedbackLoadingState value)? loading,
    TResult Function(GetFeedbackListSuccessState value)? getFeedbackListSuccess,
    TResult Function(FeedbackErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class FeedbackLoadingState implements FeedbackState {
  const factory FeedbackLoadingState() = _$FeedbackLoadingStateImpl;
}

/// @nodoc
abstract class _$$GetFeedbackListSuccessStateImplCopyWith<$Res> {
  factory _$$GetFeedbackListSuccessStateImplCopyWith(
          _$GetFeedbackListSuccessStateImpl value,
          $Res Function(_$GetFeedbackListSuccessStateImpl) then) =
      __$$GetFeedbackListSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<FeedbackModel> feedbacks});
}

/// @nodoc
class __$$GetFeedbackListSuccessStateImplCopyWithImpl<$Res>
    extends _$FeedbackStateCopyWithImpl<$Res, _$GetFeedbackListSuccessStateImpl>
    implements _$$GetFeedbackListSuccessStateImplCopyWith<$Res> {
  __$$GetFeedbackListSuccessStateImplCopyWithImpl(
      _$GetFeedbackListSuccessStateImpl _value,
      $Res Function(_$GetFeedbackListSuccessStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feedbacks = null,
  }) {
    return _then(_$GetFeedbackListSuccessStateImpl(
      null == feedbacks
          ? _value._feedbacks
          : feedbacks // ignore: cast_nullable_to_non_nullable
              as List<FeedbackModel>,
    ));
  }
}

/// @nodoc

class _$GetFeedbackListSuccessStateImpl implements GetFeedbackListSuccessState {
  const _$GetFeedbackListSuccessStateImpl(final List<FeedbackModel> feedbacks)
      : _feedbacks = feedbacks;

  final List<FeedbackModel> _feedbacks;
  @override
  List<FeedbackModel> get feedbacks {
    if (_feedbacks is EqualUnmodifiableListView) return _feedbacks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_feedbacks);
  }

  @override
  String toString() {
    return 'FeedbackState.getFeedbackListSuccess(feedbacks: $feedbacks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetFeedbackListSuccessStateImpl &&
            const DeepCollectionEquality()
                .equals(other._feedbacks, _feedbacks));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_feedbacks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetFeedbackListSuccessStateImplCopyWith<_$GetFeedbackListSuccessStateImpl>
      get copyWith => __$$GetFeedbackListSuccessStateImplCopyWithImpl<
          _$GetFeedbackListSuccessStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<FeedbackModel> feedbacks)
        getFeedbackListSuccess,
    required TResult Function(String message) error,
  }) {
    return getFeedbackListSuccess(feedbacks);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<FeedbackModel> feedbacks)? getFeedbackListSuccess,
    TResult? Function(String message)? error,
  }) {
    return getFeedbackListSuccess?.call(feedbacks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<FeedbackModel> feedbacks)? getFeedbackListSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (getFeedbackListSuccess != null) {
      return getFeedbackListSuccess(feedbacks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FeedbackInitial value) initial,
    required TResult Function(FeedbackLoadingState value) loading,
    required TResult Function(GetFeedbackListSuccessState value)
        getFeedbackListSuccess,
    required TResult Function(FeedbackErrorState value) error,
  }) {
    return getFeedbackListSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FeedbackInitial value)? initial,
    TResult? Function(FeedbackLoadingState value)? loading,
    TResult? Function(GetFeedbackListSuccessState value)?
        getFeedbackListSuccess,
    TResult? Function(FeedbackErrorState value)? error,
  }) {
    return getFeedbackListSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FeedbackInitial value)? initial,
    TResult Function(FeedbackLoadingState value)? loading,
    TResult Function(GetFeedbackListSuccessState value)? getFeedbackListSuccess,
    TResult Function(FeedbackErrorState value)? error,
    required TResult orElse(),
  }) {
    if (getFeedbackListSuccess != null) {
      return getFeedbackListSuccess(this);
    }
    return orElse();
  }
}

abstract class GetFeedbackListSuccessState implements FeedbackState {
  const factory GetFeedbackListSuccessState(
      final List<FeedbackModel> feedbacks) = _$GetFeedbackListSuccessStateImpl;

  List<FeedbackModel> get feedbacks;
  @JsonKey(ignore: true)
  _$$GetFeedbackListSuccessStateImplCopyWith<_$GetFeedbackListSuccessStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FeedbackErrorStateImplCopyWith<$Res> {
  factory _$$FeedbackErrorStateImplCopyWith(_$FeedbackErrorStateImpl value,
          $Res Function(_$FeedbackErrorStateImpl) then) =
      __$$FeedbackErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FeedbackErrorStateImplCopyWithImpl<$Res>
    extends _$FeedbackStateCopyWithImpl<$Res, _$FeedbackErrorStateImpl>
    implements _$$FeedbackErrorStateImplCopyWith<$Res> {
  __$$FeedbackErrorStateImplCopyWithImpl(_$FeedbackErrorStateImpl _value,
      $Res Function(_$FeedbackErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FeedbackErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FeedbackErrorStateImpl implements FeedbackErrorState {
  const _$FeedbackErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'FeedbackState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedbackErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedbackErrorStateImplCopyWith<_$FeedbackErrorStateImpl> get copyWith =>
      __$$FeedbackErrorStateImplCopyWithImpl<_$FeedbackErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<FeedbackModel> feedbacks)
        getFeedbackListSuccess,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<FeedbackModel> feedbacks)? getFeedbackListSuccess,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<FeedbackModel> feedbacks)? getFeedbackListSuccess,
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
    required TResult Function(FeedbackInitial value) initial,
    required TResult Function(FeedbackLoadingState value) loading,
    required TResult Function(GetFeedbackListSuccessState value)
        getFeedbackListSuccess,
    required TResult Function(FeedbackErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FeedbackInitial value)? initial,
    TResult? Function(FeedbackLoadingState value)? loading,
    TResult? Function(GetFeedbackListSuccessState value)?
        getFeedbackListSuccess,
    TResult? Function(FeedbackErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FeedbackInitial value)? initial,
    TResult Function(FeedbackLoadingState value)? loading,
    TResult Function(GetFeedbackListSuccessState value)? getFeedbackListSuccess,
    TResult Function(FeedbackErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class FeedbackErrorState implements FeedbackState {
  const factory FeedbackErrorState(final String message) =
      _$FeedbackErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FeedbackErrorStateImplCopyWith<_$FeedbackErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
