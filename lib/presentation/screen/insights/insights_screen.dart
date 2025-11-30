import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/user_languages.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/insights/insights_bloc.dart';
import 'package:icoc/presentation/bloc/insights/insights_event.dart';
import 'package:icoc/presentation/bloc/insights/insights_state.dart';
import 'package:icoc/presentation/screen/insights/widget/bottom_sheet_insights_filter.dart';
import 'package:icoc/presentation/screen/insights/widget/post_card.dart';
import 'package:icoc/presentation/widget/animated_filter_button.dart';
import 'package:icoc/presentation/widget/custom_refresh_indicator.dart';
import 'package:icoc/presentation/widget/modal_bottom_sheet.dart';
import 'package:icoc/presentation/widget/coming_soon_placeholder.dart';

class InsightsScreen extends StatefulWidget {
  const InsightsScreen({super.key});

  @override
  State<InsightsScreen> createState() => _InsightsScreenState();
}

class _InsightsScreenState extends State<InsightsScreen> {
  @override
  void initState() {
    _getPosts();
    super.initState();
  }

  Future<void> _getPosts() async {
    context.read<InsightsBloc>().add(const InsightsEvent.fetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insights'.tr()),
        centerTitle: true,
        actions: [
          AnimatedFilterIconButton(
            shouldAnimate: StorageKeys.shouldWallFilterAnimate,
            shouldAnimateForever: getIt<InsightsUserLanguagesHandler>()
                .getActiveLanguages()
                .isEmpty,
            onTap: () => showLangFilter(context),
            color: ScreenColors.general,
          )
        ],
      ),
      body: BlocBuilder<InsightsBloc, InsightsState>(
        builder: (context, state) {
          return state.maybeWhen(
            // loading: () => CustomRefreshIndicator(onRefresh: _getPosts),
            loaded: (posts) {
              if (posts.isEmpty) {
                return CustomRefreshIndicator(
                  onRefresh: _getPosts,
                  child: const ComingSoonPlaceholder(),
                );
              }
              return CustomRefreshIndicator(
                onRefresh: _getPosts,
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return PostCard(post: posts[index]);
                  },
                ),
              );
            },
            error: (message) => CustomRefreshIndicator(
              onRefresh: _getPosts,
              child: const ComingSoonPlaceholder(),
            ),
            orElse: () => const ComingSoonPlaceholder(),
          );
        },
      ),
    );
  }
}

Future<dynamic> showLangFilter(BuildContext context) {
  return showModalBottomSheet(
    scrollControlDisabledMaxHeightRatio: 2,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return ModalBottomSheet(
        height: MediaQuery.of(context).size.height / 1.5,
        blurBackground: false,
        child: const BottomSheetInsightsFilter(),
      );
    },
  );
}
