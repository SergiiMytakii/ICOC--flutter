import 'package:bloc/bloc.dart';
import 'package:icoc/core/model/q&a_model.dart';
import 'package:icoc/data/repository_impl/q&a_repository_impl.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

part 'q&a_event.dart';
part 'q&a_state.dart';

class QandABloc extends Bloc<QandAEvent, QandAState> {
  QandABloc() : super(QandAInitial()) {
    final log = Logger();

    on<QandAEvent>((event, emit) {
      return emit.forEach<QandAState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          log.e('$error', error: error, stackTrace: stackTrace);
          return QandAErrorState(error.toString());
        },
      );
    });
  }
}
