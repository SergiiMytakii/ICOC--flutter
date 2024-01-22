import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/constants.dart';
import 'package:icoc/core/bloc/q&a_bloc/q&a_bloc.dart';
import 'package:icoc/presentation/routes/app_routes.dart';
import 'package:icoc/presentation/widget/error_text_on_screen.dart';
import 'package:icoc/presentation/widget/loading.dart';

class QuestionsAndAnwers extends StatefulWidget {
  QuestionsAndAnwers({Key? key}) : super(key: key);

  @override
  State<QuestionsAndAnwers> createState() => _QuestionsAndAnwersState();
}

class _QuestionsAndAnwersState extends State<QuestionsAndAnwers> {
  @override
  void initState() {
    Future.delayed(Duration.zero)
        .then((value) => context.read<QandABloc>().add(QandARequested()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int i = 0;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'drawer_q_and_a'.tr(),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<QandABloc, QandAState>(
          builder: (context, state) {
            if (state is GetQandASuccessState) {
              return ListView.builder(
                itemCount: state.articles.length,
                itemBuilder: (context, index) {
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
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () => Navigator.of(context).pushNamed(
                            Routes.ONE_Q_AND_A_SCREEN,
                            arguments: state.articles[index]),
                      ),
                      Divider(
                        indent: 50,
                        color: dividerColors[i],
                        thickness: 1.2,
                      ),
                    ],
                  );
                },
              );
            } else if (state is QandALoadingState) {
              return Loading();
            } else if (state is QandAErrorState) {
              return ErrorTextOnScreen(message: state.message);
            } else {
              return Container();
            }
          },
        ));
  }
}
