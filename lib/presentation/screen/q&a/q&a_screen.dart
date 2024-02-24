import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/constants.dart';
import 'package:icoc/core/bloc/q&a_bloc/q&a_bloc.dart';
import 'package:icoc/presentation/routes/app_routes.dart';
import 'package:icoc/presentation/screen/q&a/widget/q_and_a_app_bar.dart';
import 'package:icoc/presentation/widget/error_text_on_screen.dart';
import 'package:icoc/presentation/widget/loading.dart';
import 'package:icoc/presentation/widget/unfocus_keyboard.dart';

class QuestionsAndAnswers extends StatefulWidget {
  QuestionsAndAnswers({Key? key}) : super(key: key);

  @override
  State<QuestionsAndAnswers> createState() => _QuestionsAndAnswersState();
}

class _QuestionsAndAnswersState extends State<QuestionsAndAnswers> {
  String previousQuery = '';
  @override
  void initState() {
    super.initState();
    FirebaseAnalytics.instance.logScreenView(screenName: 'Q&A');
    Future.delayed(Duration.zero, () {
      context.read<QandABloc>().add(QandARequested());
    });
  }

  @override
  Widget build(BuildContext context) {
    int i = 0;
    return Scaffold(
      body: UnfocusOnTapOutside(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            QandAAppbar(
              title: 'drawer_q_and_a'.tr(),
              callback: (String query) {
                print(query);
                if (query.length > 2) {
                  previousQuery = query;
                  context.read<QandABloc>().add(QandARequested(query: query));
                } else if (previousQuery.length > query.length) {
                  //if user deletes a characters
                  context.read<QandABloc>().add(QandARequested());
                }
              },
            ),
            BlocBuilder<QandABloc, QandAState>(
              builder: (context, state) {
                if (state is GetQandASuccessState) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (i < 4) {
                          i++;
                        } else {
                          i = 0;
                        }
                        return Column(
                          children: [
                            ListTile(
                              leading: Text(
                                state.articles[index].id.toString(),
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              title: Text(
                                state.articles[index].title,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              trailing: Icon(Icons.arrow_forward_ios),
                              onTap: () => Navigator.of(context).pushNamed(
                                Routes.ONE_Q_AND_A_SCREEN,
                                arguments: state.articles[index],
                              ),
                            ),
                            Divider(
                              indent: 50,
                              color: dividerColors[i],
                              thickness: 1.2,
                            ),
                          ],
                        );
                      },
                      childCount: state.articles.length,
                    ),
                  );
                } else if (state is QandALoadingState) {
                  return SliverToBoxAdapter(child: Loading());
                } else if (state is QandAErrorState) {
                  return SliverToBoxAdapter(
                    child: ErrorTextOnScreen(message: state.message),
                  );
                } else {
                  return SliverToBoxAdapter(child: Container());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
