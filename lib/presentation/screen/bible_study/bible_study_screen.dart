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
  final GlobalKey<TooltipState> tooltipKey1 = GlobalKey<TooltipState>();
  bool _tooltipVisible = true;

  @override
  void initState() {
    showTooltip();
    FirebaseAnalytics.instance.logScreenView(screenName: 'Bible Study');
    // Fire for re-entry when topics are already loaded
    getIt<BibleStudyBloc>().state.maybeWhen(
          success: (_, __, ___, ____) => _notifyScreenOpened(),
          orElse: () {},
        );
    super.initState();
  }

  Future<void> _getBibleStudyList() async {
    getIt<BibleStudyBloc>().add(const BibleStudyEvent.listRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: BlocConsumer<BibleStudyBloc, BibleStudyState>(
        listenWhen: (prev, curr) =>
            prev is! GetBibleStudyListSuccessState &&
            curr is GetBibleStudyListSuccessState,
        listener: (context, state) => _notifyScreenOpened(),
        builder: (context, state) {
          return state.when(
            initial: () {
              _getBibleStudyList();
              return const SizedBox();
            },
            loading: () => Scaffold(
              body: CustomRefreshIndicator(onRefresh: _getBibleStudyList),
            ),
            empty: () {
              Future.delayed(const Duration(seconds: 3))
                  .then((_) => _showLangFilter(context));

              return const NoContentWarning();
            },
            success: (topics, unreadCount, newTopicIds, newLessonIds) =>
                _buildBody(topics,
                    newTopicIds: newTopicIds, newLessonIds: newLessonIds),
            error: (message) => RefreshIndicator.adaptive(
              onRefresh: _getBibleStudyList,
              child: ListView(
                children: [
                  ErrorTextOnScreen(message: message),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar _buildAppbar() {
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
                onTap: () => _showLangFilter(context),
                shouldAnimateForever: getIt<BibleStudyUserLanguagesHandler>()
                    .getActiveLanguages()
                    .isEmpty,
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

  Widget _buildBody(
    List<BibleStudy> topics, {
    Set<int> newTopicIds = const {},
    Set<int> newLessonIds = const {},
  }) {
    final sorted = newTopicIds.isEmpty
        ? topics
        : [
            ...topics.where((t) => newTopicIds.contains(t.id)),
            ...topics.where((t) => !newTopicIds.contains(t.id)),
          ];
    return RefreshIndicator.adaptive(
      onRefresh: () => _getBibleStudyList(),
      child: topics.isNotEmpty
          ? ListView.builder(
              cacheExtent: 0,
              itemCount: sorted.length,
              itemBuilder: (context, index) {
                return AnimationWrapper(
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: newTopicIds.contains(sorted[index].id)
                            ? const _NewDot()
                            : Container(width: 40),
                        title: Text(
                          sorted[index].topic,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          sorted[index].subtopic,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          getIt<BibleStudyBloc>().add(
                            BibleStudyEvent.topicOpened(sorted[index].id),
                          );
                          context.go(
                            '/$BIBLE_STUDY/$ONE_TOPIC_SCREEN/${sorted[index].id}',
                          );
                        },
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
        tooltipKey1.currentState?.ensureTooltipVisible();
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

  void _notifyScreenOpened() {
    getIt<BibleStudyBloc>().add(const BibleStudyEvent.screenOpened());
  }
}

class _NewDot extends StatelessWidget {
  const _NewDot();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: Center(
        child: Container(
          width: 10,
          height: 10,
          decoration: const BoxDecoration(
            color: Colors.redAccent,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
