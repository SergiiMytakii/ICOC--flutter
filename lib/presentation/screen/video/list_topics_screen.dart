import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icoc/constants.dart';
import 'package:icoc/core/helpers/handle_divider_color.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/video_bloc/video_bloc.dart';
import 'package:icoc/core/helpers/shared_preferences_helper.dart';
import 'package:icoc/core/model/playlist.dart';
import 'package:icoc/presentation/routes/app_routes.dart';
import 'package:icoc/presentation/screen/video/widget/bottom_sheet_video_filter.dart';
import 'package:icoc/presentation/widget/animated_filter_button.dart';
import 'package:icoc/presentation/widget/animation_wrapper.dart';
import 'package:icoc/presentation/widget/custom_refresh_indicator.dart';
import 'package:icoc/presentation/widget/error_text_on_screen.dart';
import 'package:icoc/presentation/widget/modal_bottom_sheet.dart';
import 'package:icoc/presentation/widget/no_content_warning.dart';

class ListTopicsScreen extends StatefulWidget {
  ListTopicsScreen({super.key});

  @override
  State<ListTopicsScreen> createState() => _ListTopicsScreenState();
}

class _ListTopicsScreenState extends State<ListTopicsScreen> {
  List<Playlist>? cache;
  final GlobalKey tooltipKey2 = GlobalKey();
  bool _tooltipVisible = true;
  @override
  void initState() {
    showTooltip();
    _getTopicsList();
    super.initState();
  }

  Future<void> _getTopicsList() async {
    getIt<VideoBloc>().add(VideoListRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoBloc, VideoState>(
      builder: (context, state) {
        if (state is GetVideoListSuccessState) {
          cache = state.topics;
          return Scaffold(
              appBar: _buildAppBar(context, state.topics.isEmpty),
              body: _buildBody(state.topics));
        } else if (state is VideoLoadingState) {
          return CustomRefreshIndicator(onRefresh: () => _getTopicsList());
        } else if (state is VideoErrorState) {
          return Scaffold(
            body: RefreshIndicator.adaptive(
                onRefresh: _getTopicsList,
                child: ListView(
                  children: [
                    ErrorTextOnScreen(message: state.message),
                  ],
                )),
          );
        } else {
          return cache != null
              ? Scaffold(
                  appBar: _buildAppBar(context, false),
                  body: _buildBody(cache!))
              : const SizedBox();
        }
      },
    );
  }

  AppBar _buildAppBar(BuildContext context, bool shoudFilterAnimate) {
    return AppBar(
      title: Text(
        'Playlist'.tr(),
      ),
      centerTitle: true,
      actions: [
        Stack(
          children: [
            Visibility(
              visible: _tooltipVisible,
              child: Tooltip(
                message: 'Filter languages'.tr(),
                key: tooltipKey2,
                preferBelow: true,
                triggerMode: TooltipTriggerMode.manual,
                child: Container(
                  height: 40,
                  width: 30,
                ),
              ),
            ),
            AnimatedFilterIconButton(
                shouldAnimate: StorageKeys.shouldVideoFilterAnimate,
                shouldAnimateForever: shoudFilterAnimate,
                onTap: () => showModalBottomSheet(
                    scrollControlDisabledMaxHeightRatio: 2,
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return ModalBottomSheet(
                          height: MediaQuery.of(context).size.height / 1.5,
                          blurBackground: false,
                          child: const BottomSheetVideoFilter());
                    }),
                color: ScreenColors.video),
          ],
        )
      ],
    );
  }

  Widget _buildBody(List<Playlist> topics) {
    return RefreshIndicator.adaptive(
      onRefresh: _getTopicsList,
      child: topics.isNotEmpty
          ? ListView.builder(
              cacheExtent: 0,
              itemCount: topics.length,
              itemBuilder: (context, index) {
                return AnimationWrapper(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Container(
                          width: 40,
                        ),
                        title: Text(
                          topics[index].name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        subtitle: Text(
                          topics[index].description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () => context.go(
                            '/$VIDEO/$LIST_VIDEOS_SCREEN/${topics[index].playlistId}',
                            extra: topics[index].name),
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

  void showTooltip() {
    final double tooltipShown =
        SharedPreferencesHelper.getDouble(StorageKeys.shouldShowTooltip) ?? 0.0;
    if (tooltipShown < 4.0) {
      Future.delayed(const Duration(milliseconds: 1500)).then((value) {
        (tooltipKey2.currentState as TooltipState).ensureTooltipVisible();
        Future.delayed(const Duration(seconds: 6), () {
          if (mounted)
            setState(() {
              _tooltipVisible = false;
            });
        });
      });
      SharedPreferencesHelper.saveDouble(
          StorageKeys.shouldShowTooltip, tooltipShown + 1);
    }
  }
}
