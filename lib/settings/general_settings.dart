import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class GeneralSettings extends StatefulWidget {
  @override
  _GeneralSettingsState createState() => _GeneralSettingsState();
}

class _GeneralSettingsState extends State<GeneralSettings> {
  final Map<String, Locale> languagesLocales = {
    'ru': Locale('ru', 'RU'),
    'en': Locale('en', 'US'),
    'uk': Locale('uk', 'UK')
  };

  bool _darkTheme = false;
  String currentLanguage = '';

  @override
  Widget build(BuildContext context) {
    final List<String> languages = languagesLocales.keys.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('app_bar_settings').tr(),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          SwitchListTile.adaptive(
            title: Text(
              'settings_dark_theme',
              style: Theme.of(context).textTheme.bodyText1,
            ).tr(),
            value: _darkTheme,
            onChanged: (bool value) {
              setState(() {
                _darkTheme = value;
                _darkTheme
                    ? AdaptiveTheme.of(context).setDark()
                    : AdaptiveTheme.of(context).setLight();
                print(_darkTheme);
              });
            },
            secondary: const Icon(Icons.design_services),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.language_outlined),
                border: OutlineInputBorder(),
              ),
              value: context.locale
                  .toString()
                  .substring(0, 2), //AppLocalizations.of(context)!.localeName,
              items: languages
                  .map((language) => DropdownMenuItem(
                        value: language,
                        child: Text(
                          textForItems(language),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ))
                  .toList(),
              onChanged: (val) {
                setState(() => currentLanguage = val.toString());
                context.setLocale(languagesLocales[currentLanguage]!);
              },
            ),
          ),
          // font scale adjusting

          //todo
          // implement sizing fonts
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(
                  Icons.text_fields,
                  color: Colors.black38,
                ),
                Slider(
                  label: 'Font size',
                  value: 10,
                  min: 10,
                  max: 32,
                  divisions: 2,
                  onChanged: (val) => setState(() {}),
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
