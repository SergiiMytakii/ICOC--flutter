part of 'q&a_bloc.dart';

@immutable
sealed class QandAEvent {}

class QandARequested extends QandAEvent {
  final String? query;

  QandARequested({this.query});
}
