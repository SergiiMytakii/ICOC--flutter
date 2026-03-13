import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/user_languages.dart';
import 'package:icoc/domain/data_sources/local/local_cache.dart';
import 'package:icoc/core/helpers/handle_divider_color.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/video_bloc/video_bloc.dart';
import 'package:icoc/domain/model/playlist/playlist.dart';
import 'package:icoc/core/routes/app_routes.dart';
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
  final GlobalKey<TooltipState> tooltipKey2 = GlobalKey<TooltipState>();
  bool _tooltipVisible = true;
  @override
  void initState() {
    showTooltip();
    super.initState();
  }

  Future<void> _getTopicsList() async {
    getIt<VideoBloc>().add(const VideoEvent.listRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: BlocBuilder<VideoBloc, VideoState>(
        builder: (context, state) {
          return state.when(
            initial: () {
              _getTopicsList();
              return const SizedBox.shrink();
            },
            empty: () {
              Future.delayed(const Duration(seconds: 3))
                  .then((_) => _showLangFilter());
              return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: const NoContentWarning());
            },
            getVideoListSuccess: (playlists) => _buildBody(playlists),
            loading: () =>
                CustomRefreshIndicator(onRefresh: () => _getTopicsList()),
            error: (message) => Scaffold(
              body: RefreshIndicator.adaptive(
                  onRefresh: _getTopicsList,
                  child: ListView(
                    children: [
                      ErrorTextOnScreen(message: message),
                    ],
                  )),
            ),
            getVideosFromPlaylistSuccess: (_) =>
                _buildBody(getIt<VideoBloc>().playlists),
          );
        },
      ),
    );
  }

  AppBar _buildAppBar() {
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
                shouldAnimateForever: getIt<VideosUserLanguagesHandler>()
                    .getActiveLanguages()
                    .isEmpty,
                onTap: () => _showLangFilter(),
                color: ScreenColors.video,
                primaryLanguage: getIt<VideosUserLanguagesHandler>()
                    .getActiveLanguages()
                    .firstOrNull),
          ],
        )
      ],
    );
  }

  Future<dynamic> _showLangFilter() {
    return showModalBottomSheet(
        scrollControlDisabledMaxHeightRatio: 2,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return ModalBottomSheet(
              height: MediaQuery.of(context).size.height / 1.5,
              blurBackground: false,
              child: const BottomSheetVideoFilter());
        });
  }

  Widget _buildBody(List<Playlist> playlists) {
    return RefreshIndicator.adaptive(
      onRefresh: _getTopicsList,
      child: playlists.isNotEmpty
          ? ListView.builder(
              cacheExtent: 0,
              itemCount: playlists.length,
              itemBuilder: (context, index) {
                return AnimationWrapper(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Container(
                          width: 40,
                        ),
                        title: Text(
                          playlists[index].title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        subtitle: Text(
                          playlists[index].description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () => context.go(
                            '/$VIDEO/$LIST_VIDEOS_SCREEN/${playlists[index].playlistId}',
                            extra: playlists[index].title),
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
    if (tooltipShown < 4.0) {
      Future.delayed(const Duration(milliseconds: 1500)).then((value) {
        tooltipKey2.currentState?.ensureTooltipVisible();
        Future.delayed(const Duration(seconds: 6), () {
          if (mounted)
            setState(() {
              _tooltipVisible = false;
            });
        });
      });
      getIt<LocalCache>()
          .saveDouble(StorageKeys.shouldShowTooltip, tooltipShown + 1);
    }
  }
}
