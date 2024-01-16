import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class GeneralSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  Localizations.localeOf(context);
    final List<String> languages = languagesCodes.keys.toList();
    final locale = Localizations.localeOf(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('app_bar_settings'.tr()),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            SwitchListTile.adaptive(
              activeColor: Theme.of(context).primaryColor,
              title: Text(
                'settings_dark_theme'.tr(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              value: true, //todo
              onChanged: (_) {},
              secondary: const Icon(Icons.design_services),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.language_outlined),
                ),
                value: locale.languageCode,

                alignment: AlignmentDirectional.topStart,
                enableFeedback:
                    true, //AppLocalizations.of(context)!.localeName,
                items: languages
                    .map((language) => DropdownMenuItem(
                          value: language,
                          child: Text(
                            language,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ))
                    .toList(),
                onChanged: (val) {
                  context.setLocale(Locale(val.toString()));
                },
              ),
            ),
          ],
        ));
  }

  String textForItems(String language) {
    switch (language) {
      case 'ru':
        return 'dropdown_menu_lang_app_russian'.tr();

      case 'en':
        return 'dropdown_menu_lang_app_english'.tr();

      case 'uk':
        return 'dropdown_menu_lang_app_ukrainian'.tr();

      default:
        return 'dropdown_menu_lang_app_russian'.tr();
    }
  }
}
