import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants.dart';
import '../../../../core/bloc/songs_bloc/songs_bloc.dart';
import '../../../../core/helpers/shared_preferences_helper.dart';
import '../../../widget/toast.dart';

class MyCheckboxListTile extends StatefulWidget {
  final ValueKey key;
  final String label;
  final List<String> allLanguages;
  final List<String> activeLanguages;
  MyCheckboxListTile(
      this.allLanguages, this.activeLanguages, this.label, this.key);

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
    return Container(
      child: CheckboxListTile(
          activeColor: screensColors['songBook'],
          key: widget.key,
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(
            fullNameLanguage(widget.label.tr()),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          value: widget.activeLanguages.contains(widget.label),
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          secondary: Icon(
            Icons.reorder,
            color: screensColors['songBook'],
          ),
          onChanged: (val) {
            if (val == true) {
              setState(() {
                if (!widget.activeLanguages.contains(widget.label)) {
                  widget.activeLanguages.add(widget.label);
                }
              });
            } else {
              if (widget.activeLanguages.length == 1) {
                showToast(
                    context: context,
                    message:
                        'At list 1 label has to be selected'); //todo fix and translate
              } else {
                setState(() {
                  widget.activeLanguages.remove(widget.label);
                });
              }
            }
            SharedPreferencesHelper.saveList(
                    SharedPreferencesKeys.orderLanguages,
                    widget.activeLanguages)
                .then(
                    (value) => context.read<SongsBloc>().add(SongsRequested()));
          }),
    );
  }

  String fullNameLanguage(String transcription) {
    if (transcription.length == 2) {
      return languagesCodes[transcription] ?? transcription;
    } else
      return transcription;
  }
}
