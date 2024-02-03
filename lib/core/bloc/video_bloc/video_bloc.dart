import 'package:bloc/bloc.dart';
import 'package:icoc/constants.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/core/helpers/shared_preferences_helper.dart';
import 'package:icoc/core/model/resources.dart';
import 'package:icoc/core/model/video.dart';
import 'package:icoc/data/repository_impl/video_repository_impl.dart';
import 'package:meta/meta.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  VideoBloc() : super(VideoInitial()) {
    on<VideoEvent>((event, emit) {
      return emit.forEach<VideoState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          logError(error, stackTrace);
          return VideoErrorState(error.toString());
        },
      );
    });
  }
}
