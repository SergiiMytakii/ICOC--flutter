import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/constants.dart';
import 'package:icoc/core/bloc/bible_study_bloc/bible_study_bloc.dart';
import 'package:icoc/presentation/screen/bible_study/widget/bottom_sheet_bible_study_filter.dart';
import 'package:icoc/presentation/routes/app_routes.dart';
import 'package:icoc/presentation/widget/animated_filter_button.dart';
import 'package:icoc/presentation/widget/custom_refresh_indicator.dart';
import 'package:icoc/presentation/widget/error_text_on_screen.dart';
import 'package:icoc/presentation/widget/modal_bottom_sheet.dart';

class BibleStudyScreen extends StatefulWidget {
  BibleStudyScreen({Key? key}) : super(key: key);

  @override
  State<BibleStudyScreen> createState() => _BibleStudyScreenState();
}

class _BibleStudyScreenState extends State<BibleStudyScreen> {
  @override
  void initState() {
    _getBibleStudyList();
    FirebaseAnalytics.instance.logScreenView(screenName: 'Bible Study');
    super.initState();
  }

  Future<void> _getBibleStudyList() async {
    Future.delayed(Duration.zero).then((value) =>
        context.read<BibleStudyBloc>().add(BibleStudyListRequested()));
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
          actions: [
            AnimatedFilterIconButton(
                shouldAnimate: StorageKeys.shouldBibleStudyFilterAnimate,
                onTap: () => showModalBottomSheet(
                    scrollControlDisabledMaxHeightRatio: 2,
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return ModalBottomSheet(
                          height: MediaQuery.of(context).size.height / 1.5,
                          blurBackground: false,
                          child: BottomSheetBibleStudyFilter());
                    }),
                color: ScreenColors.bibleStudy)
          ],
        ),
        body: BlocBuilder<BibleStudyBloc, BibleStudyState>(
          builder: (context, state) {
            if (state is GetBibleStudyListSuccessState) {
              return _buildBody(state, i);
            } else if (state is BibleStudyLoadingState) {
              return CustomRefreshIndicator(
                  onRefresh: () => _getBibleStudyList());
            } else if (state is BibleStudyErrorState) {
              return ErrorTextOnScreen(message: state.message);
            } else {
              return Container();
            }
          },
        ));
  }

  Widget _buildBody(GetBibleStudyListSuccessState state, int i) {
    return RefreshIndicator.adaptive(
      onRefresh: () => _getBibleStudyList(),
      child: ListView.builder(
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
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  width: 40,
                ),
                title: Text(
                  state.topics[index].topic,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
