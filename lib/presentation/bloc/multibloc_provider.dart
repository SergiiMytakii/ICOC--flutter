import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/presentation/bloc/bible_study_bloc/bible_study_bloc.dart';
import 'package:icoc/presentation/bloc/favorite_song_status_bloc/favorite_songs_bloc.dart';
import 'package:icoc/presentation/bloc/favorite_songs_list_bloc/favorite_songs_bloc.dart';
import 'package:icoc/presentation/bloc/feedback_bloc/feedback_bloc.dart';
import 'package:icoc/presentation/bloc/font_size_bloc/font_size_bloc.dart';
import 'package:icoc/presentation/bloc/notifications_bloc/notifications_bloc.dart';
import 'package:icoc/presentation/bloc/q&a_bloc/q&a_bloc.dart';
import 'package:icoc/presentation/bloc/songs_bloc/songs_bloc.dart';
import 'package:icoc/presentation/bloc/video_bloc/video_bloc.dart';
import 'package:icoc/injection.dart';

class MyMultiblocProvider extends StatelessWidget {
  final Widget child;

  const MyMultiblocProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SongsBloc>(
          create: (BuildContext context) => getIt<SongsBloc>(),
        ),
        BlocProvider<FontSizeBloc>(
          create: (BuildContext context) =>
              getIt<FontSizeBloc>()..add(FontSizeRequested()),
        ),
        BlocProvider<FavoriteSongsListBloc>(
          create: (BuildContext context) => getIt<FavoriteSongsListBloc>(),
        ),
        BlocProvider<FavoriteSongStatusBloc>(
          create: (BuildContext context) => getIt<FavoriteSongStatusBloc>(),
        ),
        BlocProvider<BibleStudyBloc>(
          create: (BuildContext context) => getIt<BibleStudyBloc>(),
        ),
        BlocProvider<QandABloc>(
          create: (BuildContext context) => getIt<QandABloc>(),
        ),
        BlocProvider<NotificationsBloc>(
          create: (BuildContext context) => getIt<NotificationsBloc>(),
        ),
        BlocProvider<VideoBloc>(
          create: (BuildContext context) => getIt<VideoBloc>(),
        ),
        BlocProvider<FeedbackBloc>(
          create: (BuildContext context) => getIt<FeedbackBloc>(),
        ),
      ],
      child: child,
    );
  }
}
