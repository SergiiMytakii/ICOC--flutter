import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icoc/core/helpers/handle_divider_color.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/q&a_bloc/list_q&a/q&a_bloc.dart';
import 'package:icoc/core/routes/app_routes.dart';
import 'package:icoc/presentation/screen/q&a/widget/q_and_a_app_bar.dart';
import 'package:icoc/presentation/widget/animation_wrapper.dart';
import 'package:icoc/presentation/widget/error_text_on_screen.dart';
import 'package:icoc/presentation/widget/loading.dart';
import 'package:icoc/presentation/widget/no_content_warning.dart';
import 'package:icoc/presentation/widget/unfocus_keyboard.dart';

class QuestionsAndAnswers extends StatefulWidget {
  QuestionsAndAnswers({super.key});

  @override
  State<QuestionsAndAnswers> createState() => _QuestionsAndAnswersState();
}

class _QuestionsAndAnswersState extends State<QuestionsAndAnswers> {
  String previousQuery = '';
  @override
  void initState() {
    super.initState();
    FirebaseAnalytics.instance.logScreenView(screenName: 'Q&A');
    getIt<QandABloc>().add(const QandAEvent.requested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UnfocusOnTapOutside(
        child: CustomScrollView(
          cacheExtent: 0,
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            QandAAppbar(
              title: 'drawer_q_and_a'.tr(),
              callback: (String query) {
                if (query.length > 2) {
                  previousQuery = query;
                  getIt<QandABloc>().add(QandAEvent.requested(query: query));
                } else if (previousQuery.length > query.length) {
                  //if user deletes a characters
                  getIt<QandABloc>().add(const QandAEvent.requested());
                }
              },
            ),
            BlocBuilder<QandABloc, QandAState>(
              builder: (context, state) {
                return state.when(
                  initial: () =>
                      const SliverToBoxAdapter(child: SizedBox.shrink()),
                  loading: () => SliverToBoxAdapter(child: Loading()),
                  success: (articles) {
                    if (articles.isEmpty) {
                      Future.delayed(const Duration(seconds: 3))
                          .then((_) => showLangFilter(context));
                      return SliverToBoxAdapter(
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: const NoContentWarning()),
                      );
                    } else
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return AnimationWrapper(
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Text(
                                      articles[index].id.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                    title: Text(
                                      articles[index].title,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    trailing:
                                        const Icon(Icons.arrow_forward_ios),
                                    onTap: () => context.go(
                                      '/$Q_AND_ANSVERS/$ONE_Q_AND_A_SCREEN',
                                      extra: articles[index],
                                    ),
                                  ),
                                  Divider(
                                    indent: 50,
                                    color: getDividerColor(index),
                                    thickness: 1.2,
                                  ),
                                ],
                              ),
                            );
                          },
                          childCount: articles.length,
                        ),
                      );
                  },
                  error: (message) => SliverToBoxAdapter(
                    child: ErrorTextOnScreen(message: message),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
