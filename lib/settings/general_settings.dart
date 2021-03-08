import 'package:Projects/generated/l10n.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class GeneralSettings extends StatefulWidget {
  @override
  _GeneralSettingsState createState() => _GeneralSettingsState();
}

class _GeneralSettingsState extends State<GeneralSettings> {
  bool _darkTheme = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context)!.app_bar_settings),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: Text(S.of(context)!.settings_dark_theme),
            value: _darkTheme,
            onChanged: (bool value) {
              setState(() {
                _darkTheme = value;
                AdaptiveTheme.of(context).toggleThemeMode();
              });
            },
            secondary: const Icon(Icons.design_services),
          ),
        ],
      ),
    );
  }
}
