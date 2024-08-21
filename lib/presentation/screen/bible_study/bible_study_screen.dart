import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/user_languages.dart';
import 'package:icoc/domain/data_sources/local/local_cache.dart';
import 'package:icoc/core/helpers/handle_divider_color.dart';
import 'package:icoc/domain/model/bible_study/bible_study.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/bible_study_bloc/bible_study_bloc.dart';
import 'package:icoc/presentation/screen/bible_study/widget/bottom_sheet_bible_study_filter.dart';
import 'package:icoc/core/routes/app_routes.dart';
import 'package:icoc/presentation/widget/animated_filter_button.dart';
import 'package:icoc/presentation/widget/animation_wrapper.dart';
import 'package:icoc/presentation/widget/custom_refresh_indicator.dart';
import 'package:icoc/presentation/widget/error_text_on_screen.dart';
import 'package:icoc/presentation/widget/modal_bottom_sheet.dart';
import 'package:icoc/presentation/widget/no_content_warning.dart';

class BibleStudyScreen extends StatefulWidget {
  const BibleStudyScreen({super.key});

  @override
  State<BibleStudyScreen> createState() => _BibleStudyScreenState();
}

class _BibleStudyScreenState extends State<BibleStudyScreen> {
  final GlobalKey tooltipKey1 = GlobalKey();
  bool _tooltipVisible = true;

  @override
  void initState() {
    _getBibleStudyList();
    showTooltip();
    FirebaseAnalytics.instance.logScreenView(screenName: 'Bible Study');
    super.initState();
  }

  Future<void> _getBibleStudyList() async {
    getIt<BibleStudyBloc>().add(const BibleStudyEvent.listRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BibleStudyBloc, BibleStudyState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox(),
          loading: () => Scaffold(
            body: CustomRefreshIndicator(onRefresh: _getBibleStudyList),
          ),
          success: (topics) {
            if (topics.isEmpty) {
              Future.delayed(const Duration(seconds: 3))
                  .then((_) => _showLangFilter(context));
            }
            return Scaffold(
              appBar: _buildAppbar(context, topics),
              body: _buildBody(topics),
            );
          },
          error: (message) => Scaffold(
            body: RefreshIndicator.adaptive(
              onRefresh: _getBibleStudyList,
              child: ListView(
                children: [
                  ErrorTextOnScreen(message: message),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  AppBar _buildAppbar(BuildContext context, List<BibleStudy> topics) {
    return AppBar(
      title: Text(
        'drawer_first_principles'.tr(),
      ),
      centerTitle: true,
      actions: [
        Stack(
          children: [
            Visibility(
              visible: _tooltipVisible,
              child: Tooltip(
                message: 'Filter languages'.tr(),
                key: tooltipKey1,
                preferBelow: true,
                triggerMode: TooltipTriggerMode.manual,
                child: Container(
                  height: 40,
                  width: 30,
                ),
              ),
            ),
            AnimatedFilterIconButton(
                shouldAnimate: StorageKeys.shouldBibleStudyFilterAnimate,
                shouldAnimateForever: topics.isEmpty,
                onTap: () => _showLangFilter(context),
                color: ScreenColors.bibleStudy,
                primaryLanguage: getIt<BibleStudyUserLanguagesHandler>()
                    .getActiveLanguages()
                    .firstOrNull),
          ],
        )
      ],
    );
  }

  Future<dynamic> _showLangFilter(BuildContext context) {
    return showModalBottomSheet(
      scrollControlDisabledMaxHeightRatio: 2,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return ModalBottomSheet(
          height: MediaQuery.of(context).size.height / 1.5,
          blurBackground: false,
          child: const BottomSheetBibleStudyFilter(),
        );
      },
    );
  }

  Widget _buildBody(List<BibleStudy> topics) {
    return RefreshIndicator.adaptive(
      onRefresh: () => _getBibleStudyList(),
      child: topics.isNotEmpty
          ? ListView.builder(
              cacheExtent: 0,
              itemCount: topics.length,
              itemBuilder: (context, index) {
                return AnimationWrapper(
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Container(
                          width: 40,
                        ),
                        title: Text(
                          topics[index].topic,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          topics[index].subtopic,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () => context.go(
                          '/$BIBLE_STUDY/$ONE_TOPIC_SCREEN/${topics[index].id}',
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
            )
          : const NoContentWarning(),
    );
  }

  void showTooltip() async {
    final double tooltipShown =
        await getIt<LocalCache>().getDouble(StorageKeys.shouldShowTooltip) ??
            0.0;
    if (tooltipShown < 5.0) {
      Future.delayed(const Duration(milliseconds: 1500)).then((value) {
        (tooltipKey1.currentState as TooltipState).ensureTooltipVisible();
        Future.delayed(const Duration(seconds: 6), () {
          if (mounted) {
            setState(() {
              _tooltipVisible = false;
            });
          }
        });
      });
      getIt<LocalCache>()
          .saveDouble(StorageKeys.shouldShowTooltip, tooltipShown + 1);
    }
  }
}
