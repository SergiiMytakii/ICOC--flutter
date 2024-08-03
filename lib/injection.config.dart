// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:icoc/core/data_sources/local/local_cache.dart' as _i10;
import 'package:icoc/core/data_sources/local/local_db_data_source.dart' as _i12;
import 'package:icoc/core/data_sources/local/local_q_and_a_db_data_source.dart'
    as _i4;
import 'package:icoc/core/data_sources/remote/firebase_data_source.dart' as _i8;
import 'package:icoc/core/data_sources/remote/http_client.dart' as _i6;
import 'package:icoc/core/repository/bible_study_repository.dart' as _i21;
import 'package:icoc/core/repository/feedback_repository.dart' as _i16;
import 'package:icoc/core/repository/notifications_repository.dart' as _i14;
import 'package:icoc/core/repository/q&a_repository.dart' as _i18;
import 'package:icoc/core/repository/songs_repository.dart' as _i26;
import 'package:icoc/core/repository/video_repository.dart' as _i23;
import 'package:icoc/data/data_sources_impl/local/local_cache_impl.dart'
    as _i11;
import 'package:icoc/data/data_sources_impl/local/sqlite_q_and_a_db_impl.dart'
    as _i5;
import 'package:icoc/data/data_sources_impl/local/sqlite_songs_db_impl.dart'
    as _i13;
import 'package:icoc/data/data_sources_impl/remote/firebase_data_source_impl.dart'
    as _i9;
import 'package:icoc/data/data_sources_impl/remote/http_client_impl.dart'
    as _i7;
import 'package:icoc/data/repository_impl/bible_study_repository_impl.dart'
    as _i22;
import 'package:icoc/data/repository_impl/feedback_repository_impl.dart'
    as _i17;
import 'package:icoc/data/repository_impl/notifications_repository_impl.dart'
    as _i15;
import 'package:icoc/data/repository_impl/q&a_repository_impl.dart' as _i19;
import 'package:icoc/data/repository_impl/songs_repository_impl.dart' as _i27;
import 'package:icoc/data/repository_impl/video_repository_impl.dart' as _i24;
import 'package:icoc/presentation/bloc/bible_study_bloc/bible_study_bloc.dart'
    as _i29;
import 'package:icoc/presentation/bloc/favorite_song_status_bloc/favorite_songs_status_bloc.dart'
    as _i33;
import 'package:icoc/presentation/bloc/favorite_songs_list_bloc/favorite_songs_bloc.dart'
    as _i31;
import 'package:icoc/presentation/bloc/feedback_bloc/feedback_bloc.dart'
    as _i25;
import 'package:icoc/presentation/bloc/font_size_bloc/font_size_bloc.dart'
    as _i3;
import 'package:icoc/presentation/bloc/notifications_bloc/notifications_bloc.dart'
    as _i20;
import 'package:icoc/presentation/bloc/q&a_bloc/q&a_bloc.dart' as _i30;
import 'package:icoc/presentation/bloc/songs_bloc/songs_bloc.dart' as _i32;
import 'package:icoc/presentation/bloc/video_bloc/video_bloc.dart' as _i28;
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
    gh.factory<_i4.LocalQandAdB>(
      () => _i5.SqliteQandAdbImpl(),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i6.HttpClient>(
      () => _i7.HttpClientImpl(),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i8.FirebaseDataSource>(
      () => _i9.DatabaseServiceFirebase(),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i10.LocalCache>(
      () => _i11.LocalCacheImpl(),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i12.LocalSongsDB>(
      () => _i13.SqliteSongsDbImpl(localCache: gh<_i10.LocalCache>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i14.NotificationsRepository>(
      () => _i15.NotificationsRepositoryImpl(gh<_i8.FirebaseDataSource>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i16.FeedbackRepository>(
      () => _i17.FeedbackRepositoryImpl(gh<_i8.FirebaseDataSource>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i18.QandARepository>(
      () => _i19.QandARepositoryImpl(gh<_i4.LocalQandAdB>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.singleton<_i20.NotificationsBloc>(
        () => _i20.NotificationsBloc(gh<_i14.NotificationsRepository>()));
    gh.factory<_i21.BibleStudyRepository>(
      () => _i22.BibleStudyRepositoryImpl(
          firebaseDataSource: gh<_i8.FirebaseDataSource>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i23.VideoRepository>(
      () => _i24.VideoRepositoryImpl(
        gh<_i8.FirebaseDataSource>(),
        gh<_i6.HttpClient>(),
      ),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.singleton<_i25.FeedbackBloc>(
        () => _i25.FeedbackBloc(gh<_i16.FeedbackRepository>()));
    gh.factory<_i26.SongsRepository>(
      () => _i27.SongsRepositoryImpl(
        firebaseDataSource: gh<_i8.FirebaseDataSource>(),
        localDB: gh<_i12.LocalSongsDB>(),
      ),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.singleton<_i28.VideoBloc>(() => _i28.VideoBloc(
          gh<_i23.VideoRepository>(),
          gh<_i10.LocalCache>(),
        ));
    gh.singleton<_i29.BibleStudyBloc>(
        () => _i29.BibleStudyBloc(gh<_i21.BibleStudyRepository>()));
    gh.singleton<_i30.QandABloc>(
        () => _i30.QandABloc(gh<_i18.QandARepository>()));
    gh.singleton<_i31.FavoriteSongsListBloc>(
        () => _i31.FavoriteSongsListBloc(gh<_i26.SongsRepository>()));
    gh.singleton<_i32.SongsBloc>(
        () => _i32.SongsBloc(gh<_i26.SongsRepository>()));
    gh.singleton<_i33.FavoriteSongStatusBloc>(
        () => _i33.FavoriteSongStatusBloc(gh<_i26.SongsRepository>()));
    return this;
  }
}
