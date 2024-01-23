import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icoc/core/bloc/bible_study_bloc/bible_study_bloc.dart';
import 'package:icoc/core/bloc/favorite_song_status_bloc/favorite_songs_bloc.dart';
import 'package:icoc/core/bloc/favorite_songs_list_bloc/favorite_songs_bloc.dart';
import 'package:icoc/core/bloc/feedback_bloc/feedback_bloc.dart';
import 'package:icoc/core/bloc/notifications_bloc/notifications_bloc.dart';
import 'package:icoc/core/bloc/q&a_bloc/q&a_bloc.dart';
import 'package:icoc/core/bloc/video_bloc/video_bloc.dart';
import 'package:icoc/presentation/screen/bible_study/bible_study_screen.dart';
import 'package:icoc/presentation/screen/bible_study/one_lesson_screen.dart';
import 'package:icoc/presentation/screen/bible_study/one_topic_screen.dart';
import 'package:icoc/presentation/screen/home/notifications_screen.dart';
import 'package:icoc/presentation/screen/q&a/one_q&a_screen.dart';
import 'package:icoc/presentation/screen/q&a/q&a_screen.dart';
import 'package:icoc/presentation/screen/thank_you/feedback_screen.dart';
import 'package:icoc/presentation/screen/video/list_videos_screen.dart';
import 'package:icoc/presentation/screen/video/list_topics_screen.dart';
import 'package:oktoast/oktoast.dart';
import 'package:overlay_support/overlay_support.dart';
import 'constants.dart';
import 'core/bloc/font_size_bloc/font_size_bloc.dart';
import 'core/bloc/songs_bloc/songs_bloc.dart';
import 'core/helpers/shared_preferences_helper.dart';
import 'core/model/song_detail.dart';
import 'presentation/screen/home/about_app_screen.dart';
import 'presentation/screen/home/general_settings_screen.dart';
import 'presentation/screen/home/home_screen.dart';
import 'presentation/screen/home/share_app_screen.dart';
import 'presentation/screen/home/terms_of_use_screen.dart';
import 'presentation/routes/app_routes.dart';
import 'presentation/screen/songs/add_song_screen.dart';
import 'presentation/screen/songs/one_song_screen.dart';
import 'presentation/screen/songs/widget/bottom_navigation_bar.dart';
import 'presentation/widget/fade_page_route.dart';
import 'theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  String? appLocale =
      await SharedPreferencesHelper.getString(SharedPreferencesKeys.locale);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(EasyLocalization(
      useOnlyLangCode: true,
      supportedLocales: languagesCodes.keys
          .map((languageCode) => Locale(languageCode))
          .toList(),
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      child: MyApp(appLocale: appLocale, savedThemeMode: savedThemeMode)));
}

class MyApp extends StatelessWidget {
  final String? appLocale;
  final AdaptiveThemeMode? savedThemeMode;
  MyApp({Key? key, this.appLocale, this.savedThemeMode}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      initial: savedThemeMode ?? AdaptiveThemeMode.dark,
      light: myLightTheme,
      dark: myDarkTheme,
      builder: (light, dark) => MultiBlocProvider(
        providers: [
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
        ],
        child: OverlaySupport.global(
          toastTheme: ToastThemeData(textColor: Colors.white),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: light,
            darkTheme: dark,
            title: 'ICOC',
            routes: {
              Routes.HOME: (context) => HomeScreen(),
              Routes.ONE_SONG_SCREEN: (context) => OneSongScreen(),
              Routes.ADD_SONG_SCREEN: (context) => AddSongScreen(),
              Routes.ONE_TOPIC_SCREEN: (context) => OneTopicScreen(),
              Routes.ONE_LESSON_SCREEN: (context) => OneLessonScreen(),
              Routes.ONE_Q_AND_A_SCREEN: (context) => OneQandAScreen(),
              // Routes.VIDEO_PLAYER_SCREEN: (context) => VideoPlayerScreen(),
              // Routes.SHARE_APP_SCREEN: (context) => ShareAppScreen(),
              // Routes.TERMS_OF_USE: (context) => TermsOfUseAndPolicy(),
            },
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case Routes.SONGBOOK:
                  return FadePageRoute(
                    builder: (context) {
                      return MyBottomNavigationBar();
                    },
                  );
                case Routes.BIBLE_STUDY:
                  return FadePageRoute(
                    builder: (context) {
                      return BibleStudyScreen();
                    },
                  );
                case Routes.Q_AND_ANSVERS:
                  return FadePageRoute(
                    builder: (context) {
                      return QuestionsAndAnwers();
                    },
                  );
                case Routes.VIDEO:
                  return FadePageRoute(
                    builder: (context) {
                      return ListTopicsScreen();
                    },
                  );
                case Routes.SHARE_APP_SCREEN:
                  return FadePageRoute(
                    builder: (context) {
                      return ShareAppScreen();
                    },
                  );
                case Routes.SETTINGS:
                  return FadePageRoute(
                    builder: (context) {
                      return GeneralSettingsScreen();
                    },
                  );
                case Routes.TERMS_OF_USE:
                  return FadePageRoute(
                    builder: (context) {
                      return TermsOfUseAndPolicy();
                    },
                  );
                case Routes.ABOUT_APP_SCREEN:
                  return FadePageRoute(builder: (context) {
                    return AboutAppScreen();
                  });
                case Routes.FEEDBACK_SCREEN:
                  return FadePageRoute(builder: (context) {
                    return FeedbackScreen();
                  });
                case Routes.NOTIFICATIONS_SCREEN:
                  return FadePageRoute(
                    builder: (context) {
                      return NotificationsScreen();
                    },
                  );
                default:
                  return MaterialPageRoute(builder: (context) => HomeScreen());
              }
            },
          ),
        ),
      ),
    );
  }
}
