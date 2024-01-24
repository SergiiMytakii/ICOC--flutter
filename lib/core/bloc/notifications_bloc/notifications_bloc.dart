import 'package:bloc/bloc.dart';
import 'package:icoc/constants.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/core/helpers/shared_preferences_helper.dart';
import 'package:icoc/core/model/notifications_model.dart';
import 'package:icoc/data/repository_impl/notifications_repository_impl.dart';
import 'package:meta/meta.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc() : super(NotificationsInitial()) {
    on<NotificationsEvent>((event, emit) {
      return emit.forEach<NotificationsState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          logError(error, stackTrace);
          return NotificationsErrorState(error.toString());
        },
      );
    });
  }
}
