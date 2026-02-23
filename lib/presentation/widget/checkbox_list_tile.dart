// ignore_for_file: overridden_fields

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:icoc/core/notifications/push_notification_service.dart';
import 'package:icoc/injection.dart';
import 'package:logger/logger.dart';

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
  final log = Logger();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        activeColor: widget.color,
        key: widget.key,
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(widget.label.tr(),
            style: Theme.of(context).textTheme.titleLarge!),
        value: widget.allLanguages[widget.label],
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        secondary: widget.trailingIcon,
        onChanged: (val) {
          if (val != null) {
            if (widget.onlyOneActiveLangAllowed) {
              setState(() {
                for (var lang in widget.allLanguages.keys) {
                  widget.allLanguages[lang] = false;
                }
                widget.allLanguages[widget.label] = val;
              });
            } else {
              setState(() {
                widget.allLanguages[widget.label] = val;
              });
            }
          }
          widget.callback(widget.allLanguages);
          if (widget.allLanguages.values.every((element) => element == false)) {
            getIt<PushNotificationService>().showLocalNotification(
                title: 'Selection'.tr(),
                body: 'At list 1 label has to be selected'.tr());
          }
        });
  }
}
