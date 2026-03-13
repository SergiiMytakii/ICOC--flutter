// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Failure {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Failure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Failure()';
  }
}

/// @nodoc
class $FailureCopyWith<$Res> {
  $FailureCopyWith(Failure _, $Res Function(Failure) __);
}

/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
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
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(OpenAiError value)? openAiError,
    TResult Function(NotFound value)? notFound,
    TResult Function(Unknown value)? unknown,
    TResult Function(InternalError value)? internal,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ServerError() when serverError != null:
        return serverError(_that);
      case NetworkError() when networkError != null:
        return networkError(_that);
      case OpenAiError() when openAiError != null:
        return openAiError(_that);
      case NotFound() when notFound != null:
        return notFound(_that);
      case Unknown() when unknown != null:
        return unknown(_that);
      case InternalError() when internal != null:
        return internal(_that);
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
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(OpenAiError value) openAiError,
    required TResult Function(NotFound value) notFound,
    required TResult Function(Unknown value) unknown,
    required TResult Function(InternalError value) internal,
  }) {
    final _that = this;
    switch (_that) {
      case ServerError():
        return serverError(_that);
      case NetworkError():
        return networkError(_that);
      case OpenAiError():
        return openAiError(_that);
      case NotFound():
        return notFound(_that);
      case Unknown():
        return unknown(_that);
      case InternalError():
        return internal(_that);
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
    TResult? Function(ServerError value)? serverError,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(OpenAiError value)? openAiError,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(Unknown value)? unknown,
    TResult? Function(InternalError value)? internal,
  }) {
    final _that = this;
    switch (_that) {
      case ServerError() when serverError != null:
        return serverError(_that);
      case NetworkError() when networkError != null:
        return networkError(_that);
      case OpenAiError() when openAiError != null:
        return openAiError(_that);
      case NotFound() when notFound != null:
        return notFound(_that);
      case Unknown() when unknown != null:
        return unknown(_that);
      case InternalError() when internal != null:
        return internal(_that);
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
    TResult Function()? serverError,
    TResult Function()? networkError,
    TResult Function()? openAiError,
    TResult Function()? notFound,
    TResult Function()? unknown,
    TResult Function()? internal,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ServerError() when serverError != null:
        return serverError();
      case NetworkError() when networkError != null:
        return networkError();
      case OpenAiError() when openAiError != null:
        return openAiError();
      case NotFound() when notFound != null:
        return notFound();
      case Unknown() when unknown != null:
        return unknown();
      case InternalError() when internal != null:
        return internal();
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
    required TResult Function() serverError,
    required TResult Function() networkError,
    required TResult Function() openAiError,
    required TResult Function() notFound,
    required TResult Function() unknown,
    required TResult Function() internal,
  }) {
    final _that = this;
    switch (_that) {
      case ServerError():
        return serverError();
      case NetworkError():
        return networkError();
      case OpenAiError():
        return openAiError();
      case NotFound():
        return notFound();
      case Unknown():
        return unknown();
      case InternalError():
        return internal();
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
    TResult? Function()? serverError,
    TResult? Function()? networkError,
    TResult? Function()? openAiError,
    TResult? Function()? notFound,
    TResult? Function()? unknown,
    TResult? Function()? internal,
  }) {
    final _that = this;
    switch (_that) {
      case ServerError() when serverError != null:
        return serverError();
      case NetworkError() when networkError != null:
        return networkError();
      case OpenAiError() when openAiError != null:
        return openAiError();
      case NotFound() when notFound != null:
        return notFound();
      case Unknown() when unknown != null:
        return unknown();
      case InternalError() when internal != null:
        return internal();
      case _:
        return null;
    }
  }
}

/// @nodoc

class ServerError extends Failure {
  const ServerError() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ServerError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Failure.serverError()';
  }
}

/// @nodoc

class NetworkError extends Failure {
  const NetworkError() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NetworkError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Failure.networkError()';
  }
}

/// @nodoc

class OpenAiError extends Failure {
  const OpenAiError() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OpenAiError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Failure.openAiError()';
  }
}

/// @nodoc

class NotFound extends Failure {
  const NotFound() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NotFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Failure.notFound()';
  }
}

/// @nodoc

class Unknown extends Failure {
  const Unknown() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Unknown);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Failure.unknown()';
  }
}

/// @nodoc

class InternalError extends Failure {
  const InternalError() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InternalError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Failure.internal()';
  }
}

// dart format on
