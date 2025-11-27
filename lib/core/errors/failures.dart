import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.serverError() = ServerError;
  const factory Failure.networkError() = NetworkError;
  const factory Failure.openAiError() = OpenAiError;
  const factory Failure.notFound() = NotFound;
  const factory Failure.unknown() = Unknown;
  const factory Failure.internal() = InternalError;

  String toUserFriendlyMessage() {
    return when(
      serverError: () =>
          'Server error. Please check your internet connection and try again.'
              .tr(),
      networkError: () =>
          'Network error. Please check your internet connection.'.tr(),
      notFound: () => 'The requested resource was not found.'.tr(),
      unknown: () =>
          'An unknown error occurred. Please try again later. If the error persists, please contact the developer.'
              .tr(),
      openAiError: () => 'ChatGpt error. Please try again later.'.tr(),
      internal: () =>
          'Internal app error. Please try again later. If the error persists, please contact the developer.'
              .tr(),
    );
  }

  const Failure._();
}
