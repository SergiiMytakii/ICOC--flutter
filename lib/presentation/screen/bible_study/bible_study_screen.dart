import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/constants.dart';
import 'package:icoc/core/bloc/bible_study_bloc/bible_study_bloc.dart';
import 'package:icoc/presentation/screen/bible_study/widget/bottom_sheet_bible_study_filter.dart';
import 'package:icoc/presentation/screen/routes/app_routes.dart';
import 'package:icoc/presentation/widget/loading.dart';
import 'package:icoc/presentation/widget/modal_bottom_sheet.dart';

class BibleStudyScreen extends StatefulWidget {
  BibleStudyScreen({Key? key}) : super(key: key);

  @override
  State<BibleStudyScreen> createState() => _BibleStudyScreenState();
}

class _BibleStudyScreenState extends State<BibleStudyScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) =>
        context.read<BibleStudyBloc>().add(BibleStudyListRequested()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int i = 0;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'drawer_first_principles'.tr(),
          ),
          centerTitle: true,
          actions: [buildFilterButton(context)],
        ),
        body: BlocBuilder<BibleStudyBloc, BibleStudyState>(
          builder: (context, state) {
            if (state is GetBibleStudyListSuccessState) {
              return ListView.builder(
                itemCount: state.topics.length,
                itemBuilder: (context, index) {
                  if (i < 4) {
                    i++;
                  } else {
                    i = 0;
                  }
                  return Column(
                    children: [
                      ListTile(
                        leading: Container(
                          width: 40,
                        ),
                        title: Text(
                          state.topics[index].topic,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        subtitle: Text(
                          state.topics[index].subtopic,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () => Navigator.of(context).pushNamed(
                            Routes.ONE_TOPIC_SCREEN,
                            arguments: state.topics[index]),
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
            } else if (state is BibleStudyLoadingState) {
              return Loading();
            } else if (state is BibleStudyErrorState) {
              return ErrorWidget(state.message);
            } else {
              return Container();
            }
          },
        ));
  }

  IconButton buildFilterButton(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.filter_alt_outlined,
      ),
      tooltip: 'icon_button_actions_app_bar_filter'.tr(),
      onPressed: () {
        showModalBottomSheet(
            scrollControlDisabledMaxHeightRatio: 2,
            context: context,
            backgroundColor: Colors.transparent,
            builder: (BuildContext context) {
              return ModalBottomSheet(
                  height: MediaQuery.of(context).size.height / 1.5,
                  blurBackground: false,
                  child: BottomSheetBibleStudyFilter());
            });
      },
    );
  }
}
