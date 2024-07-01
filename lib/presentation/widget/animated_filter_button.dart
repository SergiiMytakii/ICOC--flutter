import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:icoc/core/helpers/shared_preferences_helper.dart';

class AnimatedFilterIconButton extends StatefulWidget {
  final Function onTap;
  final Color color;
  final String shouldAnimate;
  final bool shouldAnimateForever;
  final String? firstLanguage;

  const AnimatedFilterIconButton(
      {super.key,
      required this.onTap,
      required this.color,
      required this.shouldAnimate,
      this.shouldAnimateForever = false,
      this.firstLanguage});

  @override
  _AnimatedFilterIconButtonState createState() =>
      _AnimatedFilterIconButtonState();
}

class _AnimatedFilterIconButtonState extends State<AnimatedFilterIconButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late bool shouldAnimate;

  @override
  void initState() {
    super.initState();
    shouldAnimate =
        SharedPreferencesHelper.getBool(widget.shouldAnimate) ?? true;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    if (shouldAnimate || widget.shouldAnimateForever) {
      print('animate');
      _controller.repeat(reverse: true);
    }
  }

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
                widget.firstLanguage ?? context.locale.languageCode,
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
              SharedPreferencesHelper.saveBool(widget.shouldAnimate, false);
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
