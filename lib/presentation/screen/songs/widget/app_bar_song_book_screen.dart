import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/user_languages.dart';
import 'package:icoc/domain/data_sources/local/local_cache.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/songs_bloc/songs_bloc.dart';
import 'package:icoc/presentation/widget/animated_filter_button.dart';

import 'package:icoc/presentation/widget/modal_bottom_sheet.dart';
import 'package:icoc/core/routes/app_routes.dart';
import 'package:icoc/presentation/screen/songs/widget/bottom_sheet_song_filter.dart';

class SongBookAppbar extends StatefulWidget {
  SongBookAppbar(this.callback, {super.key});

  final Function callback;

  @override
  State<SongBookAppbar> createState() => _SongBookAppbarState();
}

class _SongBookAppbarState extends State<SongBookAppbar> {
  final songsUserLanguagesHandler = getIt<SongsUserLanguagesHandler>();
  final GlobalKey tooltipKey = GlobalKey();
  bool _tooltipVisible = true;

  @override
  void initState() {
    if (songsUserLanguagesHandler.getActiveLanguages().isEmpty) {
      Future.delayed(const Duration(seconds: 3))
          .then((_) => _showSelectLangBottomSheet());
    }
    showTooltip();
    super.initState();
  }

  void showTooltip() async {
    final double tooltipShown =
        await getIt<LocalCache>().getDouble(StorageKeys.shouldShowTooltip) ??
            0.0;
    if (tooltipShown < 4.0) {
      Future.delayed(const Duration(milliseconds: 1500)).then((value) {
        (tooltipKey.currentState as TooltipState).ensureTooltipVisible();
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

  @override
  Widget build(
    BuildContext context,
  ) {
    return SliverAppBar(
      title: Text(
        'app_bar_title'.tr(),
      ),
      centerTitle: true,
      actions: [
        Stack(
          children: [
            Visibility(
              visible: _tooltipVisible,
              child: Tooltip(
                message: 'Filter languages'.tr(),
                key: tooltipKey,
                preferBelow: true,
                triggerMode: TooltipTriggerMode.manual,
                child: Container(
                  height: 40,
                  width: 30,
                ),
              ),
            ),
            BlocBuilder<SongsBloc, SongsState>(
              builder: (context, state) {
                final bool shouldAnimate = state.maybeWhen(
                  empty: () => true,
                  orElse: () => false,
                );
                return AnimatedFilterIconButton(
                    shouldAnimateForever: shouldAnimate,
                    shouldAnimate: StorageKeys.shouldSongsFilterAnimate,
                    color: ScreenColors.songBook,
                    primaryLanguage: songsUserLanguagesHandler.primaryLang,
                    onTap: () => _showSelectLangBottomSheet());
              },
            ),
          ],
        ),
        buildAddSongButton(context)
      ],
      pinned: true,
      expandedHeight: 95,
      backgroundColor: WidgetStateColor.resolveWith((states) =>
          AdaptiveTheme.of(context).theme.appBarTheme.backgroundColor!),
      floating: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 45,
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 8,
            ),
            child: CupertinoSearchTextField(
              onChanged: (val) {
                widget.callback(val);
              },
              style: AdaptiveTheme.of(context).theme.textTheme.bodySmall,
              backgroundColor: AdaptiveTheme.of(context).theme.focusColor,
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showSelectLangBottomSheet() {
    return showModalBottomSheet(
        scrollControlDisabledMaxHeightRatio: 2,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return ModalBottomSheet(
              height: MediaQuery.of(context).size.height / 1.4,
              blurBackground: false,
              child: const BottomSheetSongsFilter());
        });
  }
}

IconButton buildAddSongButton(BuildContext context) {
  return IconButton(
    icon: const Icon(
      Icons.add,
    ),
    tooltip: 'icon_button_actions_app_bar_add_song'.tr(),
    onPressed: () {
      context.go('/$SONGBOOK/$ADD_SONG_SCREEN');
    },
  );
}
