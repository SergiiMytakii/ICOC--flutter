import 'dart:ui';
import 'package:Projects/app/core/controllers/General_settings_controller.dart';
import 'package:Projects/shared/constants.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getxfire/getxfire.dart';

class GeneralSettings extends GetView<GeneralSettingsController> {
  final GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    Get.put(GeneralSettingsController());
    final List<String> languages = Constants().languagesLocales.keys.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('app_bar_settings'.tr),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Obx(() => SwitchListTile.adaptive(
                title: Text(
                  'settings_dark_theme'.tr,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                value: controller.darkTheme.value,
                onChanged: (bool value) {
                  controller.darkTheme.toggle();
                  controller.darkTheme.value
                      ? AdaptiveTheme.of(context).setDark()
                      : AdaptiveTheme.of(context).setLight();
                },
                secondary: const Icon(Icons.design_services),
              )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(Icons.language_outlined),
              ),
              value: window.locale
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
                Get.updateLocale(Constants().languagesLocales[val]!);
                box.write('locale', val);
              },
            ),
          ),
          // font scale adjusting

          //todo
          // implement sizing fonts
        ],
      ),
    );
  }

  String textForItems(String language) {
    switch (language) {
      case 'ru':
        return 'dropdown_menu_lang_app_russian'.tr;

      case 'en':
        return 'dropdown_menu_lang_app_english'.tr;

      case 'uk':
        return 'dropdown_menu_lang_app_ukrainian'.tr;

      default:
        return 'dropdown_menu_lang_app_russian'.tr;
    }
  }
}
