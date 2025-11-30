import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

class ComingSoonPlaceholder extends StatelessWidget {
  const ComingSoonPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 200),
        const Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: _ComingSoonText(),
          ),
        ),
      ],
    );
  }
}

class _ComingSoonText extends StatelessWidget {
  const _ComingSoonText();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Coming soon'.tr(),
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    );
  }
}
