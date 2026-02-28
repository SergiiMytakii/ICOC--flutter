// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:icoc/core/notifications/push_notification_service.dart'
    as _i706;
import 'package:icoc/core/user_languages.dart' as _i707;
import 'package:icoc/core/user_state/insights_interaction_local_store.dart'
    as _i397;
import 'package:icoc/data/data_sources_impl/local/local_cache_impl.dart'
    as _i263;
import 'package:icoc/data/data_sources_impl/local/sqlite_bible_db_impl.dart'
    as _i788;
import 'package:icoc/data/data_sources_impl/local/sqlite_songs_db_impl.dart'
    as _i1065;
import 'package:icoc/data/data_sources_impl/remote/ai_data_source.dart'
    as _i719;
import 'package:icoc/data/data_sources_impl/remote/firebase_data_source_impl.dart'
    as _i798;
import 'package:icoc/data/data_sources_impl/remote/http_client_impl.dart'
    as _i892;
import 'package:icoc/data/data_sources_impl/remote/insights_comments_data_source_impl.dart'
    as _i1060;
import 'package:icoc/data/data_sources_impl/remote/insights_data_source_impl.dart'
    as _i248;
import 'package:icoc/data/data_sources_impl/remote/insights_interactions_api.dart'
    as _i813;
import 'package:icoc/data/repository_impl/bible_study_repository_impl.dart'
    as _i2;
import 'package:icoc/data/repository_impl/feedback_repository_impl.dart'
    as _i758;
import 'package:icoc/data/repository_impl/insights_repository_impl.dart'
    as _i227;
import 'package:icoc/data/repository_impl/notifications_repository_impl.dart'
    as _i58;
import 'package:icoc/data/repository_impl/q&a_repository_impl.dart' as _i88;
import 'package:icoc/data/repository_impl/songs_repository_impl.dart' as _i528;
import 'package:icoc/data/repository_impl/video_repository_impl.dart' as _i785;
import 'package:icoc/domain/data_sources/local/local_bible_db_data_source.dart'
    as _i559;
import 'package:icoc/domain/data_sources/local/local_cache.dart' as _i868;
import 'package:icoc/domain/data_sources/local/local_db_data_source.dart'
    as _i751;
import 'package:icoc/domain/data_sources/remote/ai_data_source.dart' as _i955;
import 'package:icoc/domain/data_sources/remote/firebase_data_source.dart'
    as _i781;
import 'package:icoc/domain/data_sources/remote/http_client.dart' as _i228;
import 'package:icoc/domain/data_sources/remote/insights_comments_data_source.dart'
    as _i427;
import 'package:icoc/domain/data_sources/remote/insights_feed_data_source.dart'
    as _i685;
import 'package:icoc/domain/data_sources/remote/insights_interactions_api.dart'
    as _i583;
import 'package:icoc/domain/repository/bible_study_repository.dart' as _i299;
import 'package:icoc/domain/repository/feedback_repository.dart' as _i671;
import 'package:icoc/domain/repository/insights_repository.dart' as _i1018;
import 'package:icoc/domain/repository/notifications_repository.dart' as _i1025;
import 'package:icoc/domain/repository/q&a_repository.dart' as _i516;
import 'package:icoc/domain/repository/songs_repository.dart' as _i1034;
import 'package:icoc/domain/repository/video_repository.dart' as _i748;
import 'package:icoc/presentation/bloc/bible_study_bloc/bible_study_bloc.dart'
    as _i724;
import 'package:icoc/presentation/bloc/favorite_song_status_bloc/favorite_songs_status_bloc.dart'
    as _i545;
import 'package:icoc/presentation/bloc/favorite_songs_list_bloc/favorite_songs_bloc.dart'
    as _i182;
import 'package:icoc/presentation/bloc/feedback_bloc/feedback_bloc.dart'
    as _i570;
import 'package:icoc/presentation/bloc/font_size_bloc/font_size_bloc.dart'
    as _i900;
import 'package:icoc/presentation/bloc/insights/insights_bloc.dart' as _i707;
import 'package:icoc/presentation/bloc/insights_comments/insights_comments_bloc.dart'
    as _i406;
import 'package:icoc/presentation/bloc/notification_settings/notification_settings_bloc.dart'
    as _i373;
import 'package:icoc/presentation/bloc/notifications_bloc/notifications_bloc.dart'
    as _i1016;
import 'package:icoc/presentation/bloc/q&a_bloc/list_q&a/q&a_bloc.dart'
    as _i877;
import 'package:icoc/presentation/bloc/q&a_bloc/one_q&a/one_q&a_bloc.dart'
    as _i1036;
import 'package:icoc/presentation/bloc/songs_bloc/songs_bloc.dart' as _i1025;
import 'package:icoc/presentation/bloc/video_bloc/video_bloc.dart' as _i582;
import 'package:injectable/injectable.dart' as _i526;

const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i900.FontSizeBloc>(() => _i900.FontSizeBloc());
    gh.lazySingleton<_i685.InsightsFeedDataSource>(
        () => _i248.InsightsDataSourceImpl());
    gh.factory<_i228.HttpClient>(
      () => _i892.HttpClientImpl(),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.lazySingleton<_i427.InsightsCommentsDataSource>(
        () => _i1060.InsightsCommentsDataSourceImpl());
    gh.factory<_i868.LocalCache>(
      () => _i263.LocalCacheImpl(),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i559.LocalBibleDB>(
      () => _i788.SqliteBibleDbImpl(),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i751.LocalSongsDB>(
      () => _i1065.SqliteSongsDbImpl(localCache: gh<_i868.LocalCache>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.singleton<_i397.InsightsInteractionLocalStore>(
        () => _i397.InsightsInteractionLocalStore(gh<_i868.LocalCache>()));
    gh.singleton<_i706.PushNotificationService>(
        () => _i706.PushNotificationService(gh<_i868.LocalCache>()));
    gh.factory<_i955.AiDataSource>(
      () => _i719.AiDataSourceImpl(),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i781.FirebaseDataSource>(
      () => _i798.DatabaseServiceFirebase(),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i1034.SongsRepository>(
      () => _i528.SongsRepositoryImpl(
        firebaseDataSource: gh<_i781.FirebaseDataSource>(),
        localDB: gh<_i751.LocalSongsDB>(),
      ),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i299.BibleStudyRepository>(
      () => _i2.BibleStudyRepositoryImpl(
          firebaseDataSource: gh<_i781.FirebaseDataSource>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i516.QandARepository>(
      () => _i88.QandARepositoryImpl(
        gh<_i781.FirebaseDataSource>(),
        gh<_i955.AiDataSource>(),
        gh<_i228.HttpClient>(),
      ),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.lazySingleton<_i583.InsightsInteractionsApi>(
        () => _i813.InsightsInteractionsApiImpl(gh<_i228.HttpClient>()));
    gh.factory<_i1025.NotificationsRepository>(
      () => _i58.NotificationsRepositoryImpl(gh<_i781.FirebaseDataSource>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i671.FeedbackRepository>(
      () => _i758.FeedbackRepositoryImpl(gh<_i781.FirebaseDataSource>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i748.VideoRepository>(
      () => _i785.VideoRepositoryImpl(
        gh<_i781.FirebaseDataSource>(),
        gh<_i228.HttpClient>(),
      ),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.lazySingleton<_i1018.InsightsRepository>(
        () => _i227.InsightsRepositoryImpl(
              gh<_i685.InsightsFeedDataSource>(),
              gh<_i427.InsightsCommentsDataSource>(),
              gh<_i583.InsightsInteractionsApi>(),
            ));
    gh.factory<_i373.NotificationSettingsBloc>(() =>
        _i373.NotificationSettingsBloc(gh<_i706.PushNotificationService>()));
    gh.singleton<_i707.BibleStudyUserLanguagesHandler>(
      () => _i707.BibleStudyUserLanguagesHandler(gh<_i868.LocalCache>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.singleton<_i707.QandAUserLanguagesHandler>(
      () => _i707.QandAUserLanguagesHandler(gh<_i868.LocalCache>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.singleton<_i707.VideosUserLanguagesHandler>(
      () => _i707.VideosUserLanguagesHandler(gh<_i868.LocalCache>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.singleton<_i707.SongsUserLanguagesHandler>(
      () => _i707.SongsUserLanguagesHandler(gh<_i868.LocalCache>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.singleton<_i707.InsightsUserLanguagesHandler>(
      () => _i707.InsightsUserLanguagesHandler(gh<_i868.LocalCache>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i707.InsightsBloc>(() => _i707.InsightsBloc(
          gh<_i1018.InsightsRepository>(),
          gh<_i707.InsightsUserLanguagesHandler>(),
          gh<_i397.InsightsInteractionLocalStore>(),
        ));
    gh.singleton<_i1016.NotificationsBloc>(
        () => _i1016.NotificationsBloc(gh<_i1025.NotificationsRepository>()));
    gh.singleton<_i545.FavoriteSongStatusBloc>(
        () => _i545.FavoriteSongStatusBloc(gh<_i1034.SongsRepository>()));
    gh.factory<_i406.InsightsCommentsBloc>(() => _i406.InsightsCommentsBloc(
          gh<_i1018.InsightsRepository>(),
          gh<_i397.InsightsInteractionLocalStore>(),
        ));
    gh.singleton<_i182.FavoriteSongsListBloc>(() => _i182.FavoriteSongsListBloc(
          gh<_i1034.SongsRepository>(),
          gh<_i707.SongsUserLanguagesHandler>(),
        ));
    gh.singleton<_i1025.SongsBloc>(() => _i1025.SongsBloc(
          gh<_i1034.SongsRepository>(),
          gh<_i707.SongsUserLanguagesHandler>(),
        ));
    gh.singleton<_i570.FeedbackBloc>(
        () => _i570.FeedbackBloc(gh<_i671.FeedbackRepository>()));
    gh.singleton<_i582.VideoBloc>(() => _i582.VideoBloc(
          gh<_i748.VideoRepository>(),
          gh<_i707.VideosUserLanguagesHandler>(),
        ));
    gh.singleton<_i1036.OneQandABloc>(() => _i1036.OneQandABloc(
          gh<_i516.QandARepository>(),
          gh<_i707.QandAUserLanguagesHandler>(),
        ));
    gh.singleton<_i877.QandABloc>(() => _i877.QandABloc(
          gh<_i516.QandARepository>(),
          gh<_i707.QandAUserLanguagesHandler>(),
        ));
    gh.singleton<_i724.BibleStudyBloc>(() => _i724.BibleStudyBloc(
          gh<_i299.BibleStudyRepository>(),
          gh<_i707.BibleStudyUserLanguagesHandler>(),
        ));
    return this;
  }
}
