import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:icoc/core/errors/failures.dart';
import 'package:icoc/core/user_languages.dart';
import 'package:icoc/domain/model/wall/post.dart';
import 'package:icoc/domain/model/wall/post_author.dart';
import 'package:icoc/domain/model/wall/post_type.dart';
import 'package:icoc/domain/repository/wall_repository.dart';
import 'package:icoc/presentation/bloc/wall/wall_bloc.dart';
import 'package:icoc/presentation/bloc/wall/wall_event.dart';
import 'package:icoc/presentation/bloc/wall/wall_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'wall_bloc_test.mocks.dart';

@GenerateMocks([WallRepository, WallUserLanguagesHandler])
void main() {
  late WallBloc wallBloc;
  late MockWallRepository mockWallRepository;
  late MockWallUserLanguagesHandler mockUserLanguagesHandler;

  setUp(() {
    mockWallRepository = MockWallRepository();
    mockUserLanguagesHandler = MockWallUserLanguagesHandler();
    wallBloc = WallBloc(mockWallRepository, mockUserLanguagesHandler);
  });

  final posts = [
    Post(
      id: '1',
      type: PostType.text,
      language: 'en',
      content: 'Test post',
      author: const PostAuthor(name: 'Test', avatarUrl: ''),
      createdAt: DateTime.now(),
    ),
  ];

  test('initial state is correct', () {
    expect(wallBloc.state, const WallState.initial());
  });

  blocTest<WallBloc, WallState>(
    'emits [loading, loaded] when posts are fetched successfully',
    build: () {
      when(mockUserLanguagesHandler.getActiveLanguages()).thenReturn({'en'});
      when(mockWallRepository.getPosts(languages: {'en'}))
          .thenAnswer((_) async => Right(posts));
      return wallBloc;
    },
    act: (bloc) => bloc.add(const WallEvent.fetch()),
    expect: () => [
      const WallState.loading(),
      WallState.loaded(posts),
    ],
  );

  blocTest<WallBloc, WallState>(
    'emits [loading, error] when posts fetch fails',
    build: () {
      when(mockUserLanguagesHandler.getActiveLanguages()).thenReturn({'en'});
      when(mockWallRepository.getPosts(languages: {'en'}))
          .thenAnswer((_) async => const Left(Failure.serverError()));
      return wallBloc;
    },
    act: (bloc) => bloc.add(const WallEvent.fetch()),
    expect: () => [
      const WallState.loading(),
      const WallState.error(
          'Server error. Please check your internet connection and try again.'),
    ],
  );
}
