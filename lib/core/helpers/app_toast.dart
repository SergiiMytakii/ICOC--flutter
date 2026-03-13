import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Platform-adaptive in-app feedback:
/// - Android: floating Material SnackBar
/// - iOS: native-looking overlay banner (mimics iOS notification style)
class AppToast {
  AppToast._();

  static void show(
    BuildContext context, {
    required String title,
    required String body,
  }) {
    if (Platform.isIOS) {
      _showIosOverlay(context, title: title, body: body);
    } else {
      _showSnackBar(context, title: title, body: body);
    }
  }

  static void _showSnackBar(
    BuildContext context, {
    required String title,
    required String body,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(body),
          ],
        ),
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static void _showIosOverlay(
    BuildContext context, {
    required String title,
    required String body,
  }) {
    final OverlayState overlay = Overlay.of(context);
    late OverlayEntry entry;
    entry = OverlayEntry(
      builder: (_) => _IosToastBanner(
        title: title,
        body: body,
        onDismiss: () => entry.remove(),
      ),
    );
    overlay.insert(entry);
  }
}

class _IosToastBanner extends StatefulWidget {
  const _IosToastBanner({
    required this.title,
    required this.body,
    required this.onDismiss,
  });

  final String title;
  final String body;
  final VoidCallback onDismiss;

  @override
  State<_IosToastBanner> createState() => _IosToastBannerState();
}

class _IosToastBannerState extends State<_IosToastBanner>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 380),
    );
    _slide = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    Future.delayed(const Duration(seconds: 3), _dismiss);
  }

  void _dismiss() async {
    if (!mounted) return;
    await _controller.reverse();
    widget.onDismiss();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).padding.top;
    return Positioned(
      top: topPadding + 8,
      left: 12,
      right: 12,
      child: SlideTransition(
        position: _slide,
        child: GestureDetector(
          onTap: _dismiss,
          child: Material(
            color: Colors.transparent,
            child: CupertinoPopupSurface(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/globe1.png',
                      width: 36,
                      height: 36,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            widget.body,
                            style: const TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
