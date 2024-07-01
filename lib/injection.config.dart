// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:icoc/core/repository/bible_study_repository.dart' as _i14;
import 'package:icoc/core/repository/feedback_repository.dart' as _i12;
import 'package:icoc/core/repository/mock_repos/mock_songs_repository.dart'
    as _i11;
import 'package:icoc/core/repository/notifications_repository.dart' as _i8;
import 'package:icoc/core/repository/q&a_repository.dart' as _i6;
import 'package:icoc/core/repository/songs_repository.dart' as _i10;
import 'package:icoc/core/repository/video_repository.dart' as _i16;
import 'package:icoc/data/firebase/database_firebase_service.dart' as _i4;
import 'package:icoc/data/local/sqlite_helper_fts4.dart' as _i3;
import 'package:icoc/data/repository_impl/bible_study_repository_impl.dart'
    as _i15;
import 'package:icoc/data/repository_impl/feedback_repository_impl.dart'
    as _i13;
import 'package:icoc/data/repository_impl/notifications_repository_impl.dart'
    as _i9;
import 'package:icoc/data/repository_impl/q&a_repository_impl.dart' as _i7;
import 'package:icoc/data/repository_impl/songs_repository_impl.dart' as _i21;
import 'package:icoc/data/repository_impl/video_repository_impl.dart' as _i17;
import 'package:icoc/presentation/bloc/bible_study_bloc/bible_study_bloc.dart'
    as _i19;
import 'package:icoc/presentation/bloc/favorite_song_status_bloc/favorite_songs_bloc.dart'
    as _i25;
import 'package:icoc/presentation/bloc/favorite_songs_list_bloc/favorite_songs_bloc.dart'
    as _i23;
import 'package:icoc/presentation/bloc/feedback_bloc/feedback_bloc.dart'
    as _i26;
import 'package:icoc/presentation/bloc/font_size_bloc/font_size_bloc.dart'
    as _i5;
import 'package:icoc/presentation/bloc/notifications_bloc/notifications_bloc.dart'
    as _i22;
import 'package:icoc/presentation/bloc/q&a_bloc/q&a_bloc.dart' as _i20;
import 'package:icoc/presentation/bloc/songs_bloc/songs_bloc.dart' as _i24;
import 'package:icoc/presentation/bloc/video_bloc/video_bloc.dart' as _i18;
import 'package:injectable/injectable.dart' as _i2;

const String _dev = 'dev';
const String _prod = 'prod';
const String _test = 'test';

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
    gh.factory<_i3.DatabaseHelperFTS4>(() => _i3.DatabaseHelperFTS4());
    gh.factory<_i4.DatabaseServiceFirebase>(
        () => _i4.DatabaseServiceFirebase());
    gh.singleton<_i5.FontSizeBloc>(() => _i5.FontSizeBloc());
    gh.factory<_i6.QandARepository>(
      () => _i7.QandARepositoryImpl(),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i8.NotificationsRepository>(
      () => _i9.NotificationsRepositoryImpl(),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i10.SongsRepository>(
      () => _i11.MockSongsRepository(),
      registerFor: {_test},
    );
    gh.factory<_i12.FeedbackRepository>(
      () => _i13.FeedbackRepositoryImpl(),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i14.BibleStudyRepository>(
      () => _i15.BibleStudyRepositoryImpl(),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i16.VideoRepository>(
      () => _i17.VideoRepositoryImpl(),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.singleton<_i18.VideoBloc>(
        () => _i18.VideoBloc(gh<_i16.VideoRepository>()));
    gh.singleton<_i19.BibleStudyBloc>(
        () => _i19.BibleStudyBloc(gh<_i14.BibleStudyRepository>()));
    gh.singleton<_i20.QandABloc>(
        () => _i20.QandABloc(gh<_i6.QandARepository>()));
    gh.factory<_i10.SongsRepository>(
      () => _i21.SongsRepositoryImpl(
        databaseServiceFirebase: gh<_i4.DatabaseServiceFirebase>(),
        databaseHelperFTS4: gh<_i3.DatabaseHelperFTS4>(),
      ),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.singleton<_i22.NotificationsBloc>(
        () => _i22.NotificationsBloc(gh<_i8.NotificationsRepository>()));
    gh.singleton<_i23.FavoriteSongsListBloc>(
        () => _i23.FavoriteSongsListBloc(gh<_i10.SongsRepository>()));
    gh.singleton<_i24.SongsBloc>(
        () => _i24.SongsBloc(gh<_i10.SongsRepository>()));
    gh.singleton<_i25.FavoriteSongStatusBloc>(
        () => _i25.FavoriteSongStatusBloc(gh<_i10.SongsRepository>()));
    gh.singleton<_i26.FeedbackBloc>(
        () => _i26.FeedbackBloc(gh<_i12.FeedbackRepository>()));
    return this;
  }
}
