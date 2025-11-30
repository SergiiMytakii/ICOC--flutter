import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:icoc/core/errors/failures.dart';
import 'package:icoc/core/user_languages.dart';
import 'package:icoc/domain/model/insights/post.dart';
import 'package:icoc/domain/model/insights/post_author.dart';
import 'package:icoc/domain/model/insights/post_type.dart';
import 'package:icoc/domain/repository/insights_repository.dart';
import 'package:icoc/presentation/bloc/insights/insights_bloc.dart';
import 'package:icoc/presentation/bloc/insights/insights_event.dart';
import 'package:icoc/presentation/bloc/insights/insights_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'insights_bloc_test.mocks.dart';

@GenerateMocks([InsightsRepository, InsightsUserLanguagesHandler])
void main() {
  late InsightsBloc bloc;
  late MockInsightsRepository mockRepository;
  late MockInsightsUserLanguagesHandler mockUserLanguagesHandler;

  setUp(() {
    mockRepository = MockInsightsRepository();
    mockUserLanguagesHandler = MockInsightsUserLanguagesHandler();
    bloc = InsightsBloc(mockRepository, mockUserLanguagesHandler);
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
    expect(bloc.state, const InsightsState.initial());
  });

  blocTest<InsightsBloc, InsightsState>(
    'emits [loading, loaded] when posts are fetched successfully',
    build: () {
      when(mockUserLanguagesHandler.getActiveLanguages()).thenReturn({'en'});
      when(mockRepository.getPosts(languages: {'en'}))
          .thenAnswer((_) async => Right(posts));
      return bloc;
    },
    act: (bloc) => bloc.add(const InsightsEvent.fetch()),
    expect: () => [
      const InsightsState.loading(),
      InsightsState.loaded(posts),
    ],
  );

  blocTest<InsightsBloc, InsightsState>(
    'emits [loading, error] when posts fetch fails',
    build: () {
      when(mockUserLanguagesHandler.getActiveLanguages()).thenReturn({'en'});
      when(mockRepository.getPosts(languages: {'en'}))
          .thenAnswer((_) async => const Left(Failure.serverError()));
      return bloc;
    },
    act: (bloc) => bloc.add(const InsightsEvent.fetch()),
    expect: () => [
      const InsightsState.loading(),
      const InsightsState.error(
          'Server error. Please check your internet connection and try again.'),
    ],
  );
}
