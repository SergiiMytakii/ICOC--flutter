import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../globals.dart';

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

  bool _darkTheme = true;

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
          SwitchListTile(
            title: Text('settings_dark_theme').tr(),
            value: _darkTheme,
            onChanged: (bool value) {
              setState(() {
                _darkTheme = value;
                AdaptiveTheme.of(context).toggleThemeMode();
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
                        child: Text(textForItems(language)),
                      ))
                  .toList(),
              onChanged: (val) {
                setState(() => currentLanguage = val.toString());
                context.setLocale(languagesLocales[currentLanguage]!);
                print('set $currentLanguage language');
              },
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
        break;
      case 'en':
        return 'dropdown_menu_lang_app_english'.tr();
        break;
      case 'uk':
        return 'dropdown_menu_lang_app_ukrainian'.tr();
        break;
      default:
        return 'dropdown_menu_lang_app_english'.tr();
    }
  }

// void readLangPreferences() async {
//   SharedPreferences prefSettingsLang = await SharedPreferences.getInstance();
//   if (prefSettingsLang.getString('settingsLang') == null)
//     setState(() {
//       currentLanguage =
//           Intl.getCurrentLocale(); //AppLocalizations.of(context)!.localeName;
//
//       print(currentLanguage);
//     });
// }
}
