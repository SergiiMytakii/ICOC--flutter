import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/core/bloc/bible_study_bloc/bible_study_bloc.dart';
import 'package:icoc/core/bloc/favorite_song_status_bloc/favorite_songs_bloc.dart';
import 'package:icoc/core/bloc/favorite_songs_list_bloc/favorite_songs_bloc.dart';
import 'package:icoc/core/bloc/feedback_bloc/feedback_bloc.dart';
import 'package:icoc/core/bloc/font_size_bloc/font_size_bloc.dart';
import 'package:icoc/core/bloc/notifications_bloc/notifications_bloc.dart';
import 'package:icoc/core/bloc/q&a_bloc/q&a_bloc.dart';
import 'package:icoc/core/bloc/songs_bloc/songs_bloc.dart';
import 'package:icoc/core/bloc/video_bloc/video_bloc.dart';

Widget MyMultiblocProvider({required Widget child}) {
  return MultiBlocProvider(providers: [
    BlocProvider<SongsBloc>(
      create: (BuildContext context) => SongsBloc(),
    ),
    BlocProvider<FontSizeBloc>(
      create: (BuildContext context) =>
          FontSizeBloc()..add(FontSizeRequested()),
    ),
    BlocProvider<FavoriteSongsListBloc>(
      create: (BuildContext context) => FavoriteSongsListBloc(),
    ),
    BlocProvider<FavoriteSongStatusBloc>(
      create: (BuildContext context) => FavoriteSongStatusBloc(),
    ),
    BlocProvider<BibleStudyBloc>(
      create: (BuildContext context) => BibleStudyBloc(),
    ),
    BlocProvider<QandABloc>(
      create: (BuildContext context) => QandABloc(),
    ),
    BlocProvider<NotificationsBloc>(
      create: (BuildContext context) => NotificationsBloc(),
    ),
    BlocProvider<VideoBloc>(
      create: (BuildContext context) => VideoBloc(),
    ),
    BlocProvider<FeedbackBloc>(
      create: (BuildContext context) => FeedbackBloc(),
    ),
  ], child: child);
}
