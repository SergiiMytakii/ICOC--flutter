import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:icoc/presentation/widget/toast.dart';

import '../../../../constants.dart';

class MyCheckboxListTile extends StatefulWidget {
  final ValueKey key;
  final String label;
  final Color color;
  final Icon? trailingIcon;
  final Function callback;
  final List<String> allLanguages;
  final List<String> activeLanguages;
  MyCheckboxListTile(
      {required this.allLanguages,
      required this.activeLanguages,
      required this.label,
      required this.key,
      this.trailingIcon,
      required this.callback,
      required this.color});

  @override
  State<MyCheckboxListTile> createState() => _MyCheckboxListTileState();
}

class _MyCheckboxListTileState extends State<MyCheckboxListTile> {
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
        title: Text(
          fullNameLanguage(widget.label.tr()),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        value: widget.activeLanguages.contains(widget.label),
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        secondary: widget.trailingIcon,
        onChanged: (val) {
          if (val == true) {
            setState(() {
              if (!widget.activeLanguages.contains(widget.label)) {
                widget.activeLanguages.add(widget.label);
              }
            });
            widget.callback(widget.activeLanguages);
          } else {
            if (widget.activeLanguages.length == 1) {
              showToast(
                  context: context,
                  message: 'At list 1 label has to be selected'.tr());
            } else {
              setState(() {
                widget.activeLanguages.remove(widget.label);
              });
              widget.callback(widget.activeLanguages);
            }
          }
        });
  }

  String fullNameLanguage(String transcription) {
    if (transcription.length == 2) {
      return languagesCodes[transcription] ?? transcription;
    } else
      return transcription;
  }
}