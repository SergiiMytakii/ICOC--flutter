import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icoc/constants.dart';
import 'package:icoc/core/helpers/shared_preferences_helper.dart';
import 'package:icoc/presentation/bloc/songs_bloc/songs_bloc.dart';
import 'package:icoc/presentation/widget/animated_filter_button.dart';

import 'package:icoc/presentation/widget/modal_bottom_sheet.dart';
import 'package:icoc/presentation/routes/app_routes.dart';
import 'package:icoc/presentation/screen/songs/widget/bottom_sheet_song_filter.dart';

class SongBookAppbar extends StatefulWidget {
  SongBookAppbar(this.title, this.callback, {super.key});
  final String title;
  final Function callback;

  @override
  State<SongBookAppbar> createState() => _SongBookAppbarState();
}

class _SongBookAppbarState extends State<SongBookAppbar> {
  Map<String, dynamic> allLanguages = {};
  String firstLang = '';
  final GlobalKey tooltipKey = GlobalKey();
  bool _tooltipVisible = true;

  @override
  void initState() {
    setFirstLang();
    showTooltip();

    super.initState();
  }

  void showTooltip() {
    final double tooltipShown =
        SharedPreferencesHelper.getDouble(StorageKeys.shouldShowTooltip) ?? 0.0;
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
      SharedPreferencesHelper.saveDouble(
          StorageKeys.shouldShowTooltip, tooltipShown + 1);
    }
  }

  void setFirstLang() {
    //this needed to display primary language
    final locale = SharedPreferencesHelper.getString(
          StorageKeys.locale,
        ) ??
        'en';
    allLanguages =
        SharedPreferencesHelper.getMap(StorageKeys.allSongsLanguages) ??
            {locale: true};
    allLanguages.removeWhere((key, value) => value == false);
    if (allLanguages.isNotEmpty) {
      setState(() {
        firstLang = allLanguages.keys.first;
      });
    } else {
      setState(() {
        firstLang = '';
      });
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return SliverAppBar(
      title: Text(widget.title),
      centerTitle: true,
      leading: IconButton(
          icon: Icon(
            Platform.isIOS ? Icons.arrow_back_ios_new : Icons.arrow_back,
          ),
          onPressed: () {
            context.pop();
          }),
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
                final bool shouldAnimate =
                    state is GetSongsSuccessState && state.songs.isEmpty ||
                        firstLang == '';
                return AnimatedFilterIconButton(
                  shouldAnimateForever: shouldAnimate,
                  firstLanguage: firstLang,
                  shouldAnimate: StorageKeys.shouldSongsFilterAnimate,
                  color: ScreenColors.songBook,
                  onTap: () => showModalBottomSheet(
                      scrollControlDisabledMaxHeightRatio: 2,
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (BuildContext context) {
                        return ModalBottomSheet(
                            height: MediaQuery.of(context).size.height / 1.4,
                            blurBackground: false,
                            child: const BottomSheetSongsFilter());
                      }).then(
                    (value) => setState(() {
                      setFirstLang();
                    }),
                  ),
                );
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
}

IconButton buildAddSongButton(BuildContext context) {
  return IconButton(
    icon: const Icon(
      Icons.add,
    ),
    tooltip: 'icon_button_actions_app_bar_add_song'.tr(),
    onPressed: () {
      context.push(Routes.ADD_SONG_SCREEN);
    },
  );
}
