// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Failure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() networkError,
    required TResult Function() openAiError,
    required TResult Function() notFound,
    required TResult Function() unknown,
    required TResult Function() internal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverError,
    TResult? Function()? networkError,
    TResult? Function()? openAiError,
    TResult? Function()? notFound,
    TResult? Function()? unknown,
    TResult? Function()? internal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? networkError,
    TResult Function()? openAiError,
    TResult Function()? notFound,
    TResult Function()? unknown,
    TResult Function()? internal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(OpenAiError value) openAiError,
    required TResult Function(NotFound value) notFound,
    required TResult Function(Unknown value) unknown,
    required TResult Function(InternalError value) internal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? serverError,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(OpenAiError value)? openAiError,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(Unknown value)? unknown,
    TResult? Function(InternalError value)? internal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(OpenAiError value)? openAiError,
    TResult Function(NotFound value)? notFound,
    TResult Function(Unknown value)? unknown,
    TResult Function(InternalError value)? internal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ServerErrorImplCopyWith<$Res> {
  factory _$$ServerErrorImplCopyWith(
          _$ServerErrorImpl value, $Res Function(_$ServerErrorImpl) then) =
      __$$ServerErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServerErrorImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ServerErrorImpl>
    implements _$$ServerErrorImplCopyWith<$Res> {
  __$$ServerErrorImplCopyWithImpl(
      _$ServerErrorImpl _value, $Res Function(_$ServerErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ServerErrorImpl extends ServerError {
  const _$ServerErrorImpl() : super._();

  @override
  String toString() {
    return 'Failure.serverError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ServerErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() networkError,
    required TResult Function() openAiError,
    required TResult Function() notFound,
    required TResult Function() unknown,
    required TResult Function() internal,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverError,
    TResult? Function()? networkError,
    TResult? Function()? openAiError,
    TResult? Function()? notFound,
    TResult? Function()? unknown,
    TResult? Function()? internal,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? networkError,
    TResult Function()? openAiError,
    TResult Function()? notFound,
    TResult Function()? unknown,
    TResult Function()? internal,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(OpenAiError value) openAiError,
    required TResult Function(NotFound value) notFound,
    required TResult Function(Unknown value) unknown,
    required TResult Function(InternalError value) internal,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? serverError,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(OpenAiError value)? openAiError,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(Unknown value)? unknown,
    TResult? Function(InternalError value)? internal,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(OpenAiError value)? openAiError,
    TResult Function(NotFound value)? notFound,
    TResult Function(Unknown value)? unknown,
    TResult Function(InternalError value)? internal,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerError extends Failure {
  const factory ServerError() = _$ServerErrorImpl;
  const ServerError._() : super._();
}

/// @nodoc
abstract class _$$NetworkErrorImplCopyWith<$Res> {
  factory _$$NetworkErrorImplCopyWith(
          _$NetworkErrorImpl value, $Res Function(_$NetworkErrorImpl) then) =
      __$$NetworkErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NetworkErrorImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NetworkErrorImpl>
    implements _$$NetworkErrorImplCopyWith<$Res> {
  __$$NetworkErrorImplCopyWithImpl(
      _$NetworkErrorImpl _value, $Res Function(_$NetworkErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NetworkErrorImpl extends NetworkError {
  const _$NetworkErrorImpl() : super._();

  @override
  String toString() {
    return 'Failure.networkError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NetworkErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() networkError,
    required TResult Function() openAiError,
    required TResult Function() notFound,
    required TResult Function() unknown,
    required TResult Function() internal,
  }) {
    return networkError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverError,
    TResult? Function()? networkError,
    TResult? Function()? openAiError,
    TResult? Function()? notFound,
    TResult? Function()? unknown,
    TResult? Function()? internal,
  }) {
    return networkError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? networkError,
    TResult Function()? openAiError,
    TResult Function()? notFound,
    TResult Function()? unknown,
    TResult Function()? internal,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(OpenAiError value) openAiError,
    required TResult Function(NotFound value) notFound,
    required TResult Function(Unknown value) unknown,
    required TResult Function(InternalError value) internal,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? serverError,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(OpenAiError value)? openAiError,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(Unknown value)? unknown,
    TResult? Function(InternalError value)? internal,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(OpenAiError value)? openAiError,
    TResult Function(NotFound value)? notFound,
    TResult Function(Unknown value)? unknown,
    TResult Function(InternalError value)? internal,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class NetworkError extends Failure {
  const factory NetworkError() = _$NetworkErrorImpl;
  const NetworkError._() : super._();
}

/// @nodoc
abstract class _$$OpenAiErrorImplCopyWith<$Res> {
  factory _$$OpenAiErrorImplCopyWith(
          _$OpenAiErrorImpl value, $Res Function(_$OpenAiErrorImpl) then) =
      __$$OpenAiErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OpenAiErrorImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$OpenAiErrorImpl>
    implements _$$OpenAiErrorImplCopyWith<$Res> {
  __$$OpenAiErrorImplCopyWithImpl(
      _$OpenAiErrorImpl _value, $Res Function(_$OpenAiErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OpenAiErrorImpl extends OpenAiError {
  const _$OpenAiErrorImpl() : super._();

  @override
  String toString() {
    return 'Failure.openAiError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OpenAiErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() networkError,
    required TResult Function() openAiError,
    required TResult Function() notFound,
    required TResult Function() unknown,
    required TResult Function() internal,
  }) {
    return openAiError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverError,
    TResult? Function()? networkError,
    TResult? Function()? openAiError,
    TResult? Function()? notFound,
    TResult? Function()? unknown,
    TResult? Function()? internal,
  }) {
    return openAiError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? networkError,
    TResult Function()? openAiError,
    TResult Function()? notFound,
    TResult Function()? unknown,
    TResult Function()? internal,
    required TResult orElse(),
  }) {
    if (openAiError != null) {
      return openAiError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(OpenAiError value) openAiError,
    required TResult Function(NotFound value) notFound,
    required TResult Function(Unknown value) unknown,
    required TResult Function(InternalError value) internal,
  }) {
    return openAiError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? serverError,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(OpenAiError value)? openAiError,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(Unknown value)? unknown,
    TResult? Function(InternalError value)? internal,
  }) {
    return openAiError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(OpenAiError value)? openAiError,
    TResult Function(NotFound value)? notFound,
    TResult Function(Unknown value)? unknown,
    TResult Function(InternalError value)? internal,
    required TResult orElse(),
  }) {
    if (openAiError != null) {
      return openAiError(this);
    }
    return orElse();
  }
}

abstract class OpenAiError extends Failure {
  const factory OpenAiError() = _$OpenAiErrorImpl;
  const OpenAiError._() : super._();
}

/// @nodoc
abstract class _$$NotFoundImplCopyWith<$Res> {
  factory _$$NotFoundImplCopyWith(
          _$NotFoundImpl value, $Res Function(_$NotFoundImpl) then) =
      __$$NotFoundImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotFoundImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NotFoundImpl>
    implements _$$NotFoundImplCopyWith<$Res> {
  __$$NotFoundImplCopyWithImpl(
      _$NotFoundImpl _value, $Res Function(_$NotFoundImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NotFoundImpl extends NotFound {
  const _$NotFoundImpl() : super._();

  @override
  String toString() {
    return 'Failure.notFound()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotFoundImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() networkError,
    required TResult Function() openAiError,
    required TResult Function() notFound,
    required TResult Function() unknown,
    required TResult Function() internal,
  }) {
    return notFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverError,
    TResult? Function()? networkError,
    TResult? Function()? openAiError,
    TResult? Function()? notFound,
    TResult? Function()? unknown,
    TResult? Function()? internal,
  }) {
    return notFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? networkError,
    TResult Function()? openAiError,
    TResult Function()? notFound,
    TResult Function()? unknown,
    TResult Function()? internal,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(OpenAiError value) openAiError,
    required TResult Function(NotFound value) notFound,
    required TResult Function(Unknown value) unknown,
    required TResult Function(InternalError value) internal,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? serverError,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(OpenAiError value)? openAiError,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(Unknown value)? unknown,
    TResult? Function(InternalError value)? internal,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(OpenAiError value)? openAiError,
    TResult Function(NotFound value)? notFound,
    TResult Function(Unknown value)? unknown,
    TResult Function(InternalError value)? internal,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class NotFound extends Failure {
  const factory NotFound() = _$NotFoundImpl;
  const NotFound._() : super._();
}

/// @nodoc
abstract class _$$UnknownImplCopyWith<$Res> {
  factory _$$UnknownImplCopyWith(
          _$UnknownImpl value, $Res Function(_$UnknownImpl) then) =
      __$$UnknownImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnknownImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$UnknownImpl>
    implements _$$UnknownImplCopyWith<$Res> {
  __$$UnknownImplCopyWithImpl(
      _$UnknownImpl _value, $Res Function(_$UnknownImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnknownImpl extends Unknown {
  const _$UnknownImpl() : super._();

  @override
  String toString() {
    return 'Failure.unknown()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnknownImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() networkError,
    required TResult Function() openAiError,
    required TResult Function() notFound,
    required TResult Function() unknown,
    required TResult Function() internal,
  }) {
    return unknown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverError,
    TResult? Function()? networkError,
    TResult? Function()? openAiError,
    TResult? Function()? notFound,
    TResult? Function()? unknown,
    TResult? Function()? internal,
  }) {
    return unknown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? networkError,
    TResult Function()? openAiError,
    TResult Function()? notFound,
    TResult Function()? unknown,
    TResult Function()? internal,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(OpenAiError value) openAiError,
    required TResult Function(NotFound value) notFound,
    required TResult Function(Unknown value) unknown,
    required TResult Function(InternalError value) internal,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? serverError,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(OpenAiError value)? openAiError,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(Unknown value)? unknown,
    TResult? Function(InternalError value)? internal,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(OpenAiError value)? openAiError,
    TResult Function(NotFound value)? notFound,
    TResult Function(Unknown value)? unknown,
    TResult Function(InternalError value)? internal,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class Unknown extends Failure {
  const factory Unknown() = _$UnknownImpl;
  const Unknown._() : super._();
}

/// @nodoc
abstract class _$$InternalErrorImplCopyWith<$Res> {
  factory _$$InternalErrorImplCopyWith(
          _$InternalErrorImpl value, $Res Function(_$InternalErrorImpl) then) =
      __$$InternalErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InternalErrorImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$InternalErrorImpl>
    implements _$$InternalErrorImplCopyWith<$Res> {
  __$$InternalErrorImplCopyWithImpl(
      _$InternalErrorImpl _value, $Res Function(_$InternalErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InternalErrorImpl extends InternalError {
  const _$InternalErrorImpl() : super._();

  @override
  String toString() {
    return 'Failure.internal()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InternalErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() networkError,
    required TResult Function() openAiError,
    required TResult Function() notFound,
    required TResult Function() unknown,
    required TResult Function() internal,
  }) {
    return internal();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverError,
    TResult? Function()? networkError,
    TResult? Function()? openAiError,
    TResult? Function()? notFound,
    TResult? Function()? unknown,
    TResult? Function()? internal,
  }) {
    return internal?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? networkError,
    TResult Function()? openAiError,
    TResult Function()? notFound,
    TResult Function()? unknown,
    TResult Function()? internal,
    required TResult orElse(),
  }) {
    if (internal != null) {
      return internal();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(OpenAiError value) openAiError,
    required TResult Function(NotFound value) notFound,
    required TResult Function(Unknown value) unknown,
    required TResult Function(InternalError value) internal,
  }) {
    return internal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? serverError,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(OpenAiError value)? openAiError,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(Unknown value)? unknown,
    TResult? Function(InternalError value)? internal,
  }) {
    return internal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(OpenAiError value)? openAiError,
    TResult Function(NotFound value)? notFound,
    TResult Function(Unknown value)? unknown,
    TResult Function(InternalError value)? internal,
    required TResult orElse(),
  }) {
    if (internal != null) {
      return internal(this);
    }
    return orElse();
  }
}

abstract class InternalError extends Failure {
  const factory InternalError() = _$InternalErrorImpl;
  const InternalError._() : super._();
}
