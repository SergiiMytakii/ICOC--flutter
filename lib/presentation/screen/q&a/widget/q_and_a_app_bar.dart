import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/user_languages.dart';
import 'package:icoc/domain/data_sources/local/local_cache.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/screen/q&a/widget/bottom_sheet_q&a_filter.dart';
import 'package:icoc/presentation/widget/animated_filter_button.dart';
import 'package:icoc/presentation/widget/modal_bottom_sheet.dart';

class QandAAppbar extends StatefulWidget {
  QandAAppbar({
    super.key,
    required this.title,
    required this.callback,
  });
  final String title;
  final Function callback;

  @override
  State<QandAAppbar> createState() => _QandAAppbarState();
}

class _QandAAppbarState extends State<QandAAppbar> {
  final GlobalKey tooltipKey7 = GlobalKey();

  bool _tooltipVisible = true;

  @override
  void initState() {
    showTooltip();
    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return SliverAppBar(
      title: Text(widget.title),
      centerTitle: true,
      pinned: true,
      actions: [_buildFilterIcon(context)],
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

  Widget _buildFilterIcon(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          visible: _tooltipVisible,
          child: Tooltip(
            message: 'Filter languages'.tr(),
            key: tooltipKey7,
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
            shouldAnimateForever:
                getIt<QandAUserLanguagesHandler>().languages.isEmpty,
            onTap: () => _showLangFilter(context),
            color: ScreenColors.bibleStudy,
            primaryLanguage: getIt<QandAUserLanguagesHandler>()
                .getActiveLanguages()
                .firstOrNull),
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
          child: const BottomSheetQandAFilter(),
        );
      },
    );
  }

  void showTooltip() async {
    final double tooltipShown =
        await getIt<LocalCache>().getDouble(StorageKeys.shouldShowTooltip) ??
            0.0;
    if (tooltipShown < 5.0) {
      Future.delayed(const Duration(milliseconds: 1500)).then((value) {
        (tooltipKey7.currentState as TooltipState).ensureTooltipVisible();
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
