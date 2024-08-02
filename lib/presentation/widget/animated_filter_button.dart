import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:icoc/constants.dart';
import 'package:icoc/core/data_sources/local/local_cache.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/main.dart';

class AnimatedFilterIconButton extends StatefulWidget {
  final Function onTap;
  final Color color;
  final String shouldAnimate;
  final bool shouldAnimateForever;
  final String? primaryLanguage;

  const AnimatedFilterIconButton(
      {super.key,
      required this.onTap,
      required this.color,
      required this.shouldAnimate,
      this.shouldAnimateForever = false,
      this.primaryLanguage});

  @override
  State<AnimatedFilterIconButton> createState() =>
      _AnimatedFilterIconButtonState();
}

class _AnimatedFilterIconButtonState extends State<AnimatedFilterIconButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool shouldAnimate = false;

  @override
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _initAnimation();
  }

  Future<void> _initAnimation() async {
    shouldAnimate =
        await getIt<LocalCache>().getBool(widget.shouldAnimate) ?? true;
    if (shouldAnimate || widget.shouldAnimateForever) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final double scaleFactor =
            1.0 + 0.3 * _controller.value; // Adjust the pulsing factor

        return Transform.scale(
          scale: scaleFactor,
          child: IconButton(
            icon: Row(children: [
              Text(
                getIt<LocalCache>().getString(StorageKeys.primaryLang) ??
                    locale,
                style: TextStyle(
                  fontSize: 22,
                  color: ColorTween(
                          begin: AdaptiveTheme.of(context)
                              .theme
                              .colorScheme
                              .onSurface,
                          end: widget.color)
                      .evaluate(_controller),
                ),
              ),
              Icon(
                Icons.filter_alt_outlined,
                color: ColorTween(
                        begin: AdaptiveTheme.of(context)
                            .theme
                            .colorScheme
                            .onSurface,
                        end: widget.color)
                    .evaluate(_controller),
              ),
            ]),
            tooltip: 'icon_button_actions_app_bar_filter'.tr(),
            onPressed: () {
              _controller.animateBack(0);
              getIt<LocalCache>().saveBool(widget.shouldAnimate, false);
              widget.onTap();
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
