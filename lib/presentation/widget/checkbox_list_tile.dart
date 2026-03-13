// ignore_for_file: overridden_fields

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyCheckboxListTile extends StatefulWidget {
  @override
  final ValueKey key;
  final String label;
  final Color color;
  final Widget? trailingIcon;
  final Function callback;
  final Map<String, dynamic> allLanguages;
  final bool onlyOneActiveLangAllowed;

  // ignore: use_key_in_widget_constructors
  MyCheckboxListTile(
      {required this.allLanguages,
      required this.label,
      required this.key,
      this.trailingIcon,
      this.onlyOneActiveLangAllowed = false,
      required this.callback,
      required this.color});

  @override
  State<MyCheckboxListTile> createState() => _MyCheckboxListTileState();
}

class _MyCheckboxListTileState extends State<MyCheckboxListTile> {
  late Map<String, dynamic> _localLanguages;

  @override
  void initState() {
    super.initState();
    _localLanguages = Map<String, dynamic>.from(widget.allLanguages);
  }

  @override
  void didUpdateWidget(MyCheckboxListTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!mapEquals(oldWidget.allLanguages, widget.allLanguages)) {
      _localLanguages = Map<String, dynamic>.from(widget.allLanguages);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        activeColor: widget.color,
        key: widget.key,
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(widget.label.tr(),
            style: Theme.of(context).textTheme.titleLarge!),
        value: _localLanguages[widget.label],
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        secondary: widget.trailingIcon,
        onChanged: (val) {
          if (val != null) {
            // Check if this change would result in no active languages
            final currentActiveCount =
                _localLanguages.values.where((v) => v == true).length;
            final isCurrentlyActive = _localLanguages[widget.label] == true;
            final wouldHaveNoActiveLanguages =
                currentActiveCount == 1 && isCurrentlyActive && val == false;

            if (wouldHaveNoActiveLanguages) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('At least 1 label has to be selected'.tr()),
                  duration: const Duration(seconds: 2),
                  behavior: SnackBarBehavior.floating,
                ),
              );
              return; // Don't allow the change
            }

            setState(() {
              if (widget.onlyOneActiveLangAllowed) {
                for (var lang in _localLanguages.keys) {
                  _localLanguages[lang] = false;
                }
                _localLanguages[widget.label] = val;
              } else {
                _localLanguages[widget.label] = val;
              }
            });

            widget.callback(_localLanguages);
          }
        });
  }
}
