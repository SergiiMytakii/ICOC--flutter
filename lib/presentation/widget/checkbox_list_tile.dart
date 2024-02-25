import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:icoc/presentation/widget/toast.dart';
import 'package:logger/logger.dart';

class MyCheckboxListTile extends StatefulWidget {
  final ValueKey key;
  final String label;
  final Color color;
  final Widget? trailingIcon;
  final Function callback;
  final Map<String, dynamic> allLanguages;

  MyCheckboxListTile(
      {required this.allLanguages,
      required this.label,
      required this.key,
      this.trailingIcon,
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
    final bool bold = widget.key.value == '0';
    print(bold);
    return CheckboxListTile(
        activeColor: widget.color,
        key: widget.key,
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          widget.label.tr(),
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: bold ? FontWeight.w900 : FontWeight.normal),
        ),
        value: widget.allLanguages[widget.label],
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        secondary: widget.trailingIcon,
        onChanged: (val) {
          setState(() {
            widget.allLanguages[widget.label] = val;
            widget.callback(widget.allLanguages);
          });
          if (widget.allLanguages.values.every((element) => element == false)) {
            showToast(
                context: context,
                message: 'At list 1 label has to be selected'.tr());
          }
        });
  }
}
