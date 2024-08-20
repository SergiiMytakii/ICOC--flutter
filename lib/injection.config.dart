// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:icoc/core/user_languages.dart' as _i28;
import 'package:icoc/data/data_sources_impl/local/local_cache_impl.dart' as _i9;
import 'package:icoc/data/data_sources_impl/local/sqlite_q_and_a_db_impl.dart'
    as _i7;
import 'package:icoc/data/data_sources_impl/local/sqlite_songs_db_impl.dart'
    as _i11;
import 'package:icoc/data/data_sources_impl/remote/ai_data_source.dart' as _i13;
import 'package:icoc/data/data_sources_impl/remote/firebase_data_source_impl.dart'
    as _i15;
import 'package:icoc/data/data_sources_impl/remote/http_client_impl.dart'
    as _i5;
import 'package:icoc/data/repository_impl/bible_study_repository_impl.dart'
    as _i21;
import 'package:icoc/data/repository_impl/feedback_repository_impl.dart'
    as _i25;
import 'package:icoc/data/repository_impl/notifications_repository_impl.dart'
    as _i23;
import 'package:icoc/data/repository_impl/q&a_repository_impl.dart' as _i17;
import 'package:icoc/data/repository_impl/songs_repository_impl.dart' as _i19;
import 'package:icoc/data/repository_impl/video_repository_impl.dart' as _i27;
import 'package:icoc/domain/data_sources/local/local_cache.dart' as _i8;
import 'package:icoc/domain/data_sources/local/local_db_data_source.dart'
    as _i10;
import 'package:icoc/domain/data_sources/local/local_q_and_a_db_data_source.dart'
    as _i6;
import 'package:icoc/domain/data_sources/remote/ai_data_source.dart' as _i12;
import 'package:icoc/domain/data_sources/remote/firebase_data_source.dart'
    as _i14;
import 'package:icoc/domain/data_sources/remote/http_client.dart' as _i4;
import 'package:icoc/domain/repository/bible_study_repository.dart' as _i20;
import 'package:icoc/domain/repository/feedback_repository.dart' as _i24;
import 'package:icoc/domain/repository/notifications_repository.dart' as _i22;
import 'package:icoc/domain/repository/q&a_repository.dart' as _i16;
import 'package:icoc/domain/repository/songs_repository.dart' as _i18;
import 'package:icoc/domain/repository/video_repository.dart' as _i26;
import 'package:icoc/presentation/bloc/bible_study_bloc/bible_study_bloc.dart'
    as _i36;
import 'package:icoc/presentation/bloc/favorite_song_status_bloc/favorite_songs_status_bloc.dart'
    as _i30;
import 'package:icoc/presentation/bloc/favorite_songs_list_bloc/favorite_songs_bloc.dart'
    as _i31;
import 'package:icoc/presentation/bloc/feedback_bloc/feedback_bloc.dart'
    as _i33;
import 'package:icoc/presentation/bloc/font_size_bloc/font_size_bloc.dart'
    as _i3;
import 'package:icoc/presentation/bloc/notifications_bloc/notifications_bloc.dart'
    as _i29;
import 'package:icoc/presentation/bloc/q&a_bloc/q&a_bloc.dart' as _i35;
import 'package:icoc/presentation/bloc/songs_bloc/songs_bloc.dart' as _i32;
import 'package:icoc/presentation/bloc/video_bloc/video_bloc.dart' as _i34;
import 'package:injectable/injectable.dart' as _i2;

const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.FontSizeBloc>(() => _i3.FontSizeBloc());
    gh.factory<_i4.HttpClient>(
      () => _i5.HttpClientImpl(),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i6.LocalQandAdB>(
      () => _i7.SqliteQandAdbImpl(),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i8.LocalCache>(
      () => _i9.LocalCacheImpl(),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i10.LocalSongsDB>(
      () => _i11.SqliteSongsDbImpl(localCache: gh<_i8.LocalCache>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i12.AiDataSource>(
      () => _i13.AiDataSourceImpl(),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i14.FirebaseDataSource>(
      () => _i15.DatabaseServiceFirebase(),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i16.QandARepository>(
      () => _i17.QandARepositoryImpl(
        gh<_i14.FirebaseDataSource>(),
        gh<_i12.AiDataSource>(),
      ),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i18.SongsRepository>(
      () => _i19.SongsRepositoryImpl(
        firebaseDataSource: gh<_i14.FirebaseDataSource>(),
        localDB: gh<_i10.LocalSongsDB>(),
      ),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i20.BibleStudyRepository>(
      () => _i21.BibleStudyRepositoryImpl(
          firebaseDataSource: gh<_i14.FirebaseDataSource>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i22.NotificationsRepository>(
      () => _i23.NotificationsRepositoryImpl(gh<_i14.FirebaseDataSource>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i24.FeedbackRepository>(
      () => _i25.FeedbackRepositoryImpl(gh<_i14.FirebaseDataSource>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i26.VideoRepository>(
      () => _i27.VideoRepositoryImpl(
        gh<_i14.FirebaseDataSource>(),
        gh<_i4.HttpClient>(),
      ),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.singleton<_i28.BibleStudyUserLanguagesHandler>(
      () => _i28.BibleStudyUserLanguagesHandler(gh<_i8.LocalCache>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.singleton<_i28.QandAUserLanguagesHandler>(
      () => _i28.QandAUserLanguagesHandler(gh<_i8.LocalCache>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.singleton<_i28.VideosUserLanguagesHandler>(
      () => _i28.VideosUserLanguagesHandler(gh<_i8.LocalCache>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.singleton<_i28.SongsUserLanguagesHandler>(
      () => _i28.SongsUserLanguagesHandler(gh<_i8.LocalCache>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.singleton<_i29.NotificationsBloc>(
        () => _i29.NotificationsBloc(gh<_i22.NotificationsRepository>()));
    gh.singleton<_i30.FavoriteSongStatusBloc>(
        () => _i30.FavoriteSongStatusBloc(gh<_i18.SongsRepository>()));
    gh.singleton<_i31.FavoriteSongsListBloc>(() => _i31.FavoriteSongsListBloc(
          gh<_i18.SongsRepository>(),
          gh<_i28.SongsUserLanguagesHandler>(),
        ));
    gh.singleton<_i32.SongsBloc>(() => _i32.SongsBloc(
          gh<_i18.SongsRepository>(),
          gh<_i28.SongsUserLanguagesHandler>(),
        ));
    gh.singleton<_i33.FeedbackBloc>(
        () => _i33.FeedbackBloc(gh<_i24.FeedbackRepository>()));
    gh.singleton<_i34.VideoBloc>(() => _i34.VideoBloc(
          gh<_i26.VideoRepository>(),
          gh<_i28.VideosUserLanguagesHandler>(),
        ));
    gh.singleton<_i35.QandABloc>(() => _i35.QandABloc(
          gh<_i16.QandARepository>(),
          gh<_i28.QandAUserLanguagesHandler>(),
        ));
    gh.singleton<_i36.BibleStudyBloc>(() => _i36.BibleStudyBloc(
          gh<_i20.BibleStudyRepository>(),
          gh<_i28.BibleStudyUserLanguagesHandler>(),
        ));
    return this;
  }
}
