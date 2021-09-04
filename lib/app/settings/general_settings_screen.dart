import 'dart:ui';
import '../../index.dart';

class GeneralSettingsScreen extends GetView<GeneralSettingsController> {
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
                activeColor: Theme.of(context).primaryColor,
                title: Text(
                  'settings_dark_theme'.tr,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                value: controller.darkTheme.value,
                onChanged: (_) {
                  controller.changeThemeMode(context);
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
              value: box.read('locale') ??
                  window.locale.toString().substring(
                      0, 2), //AppLocalizations.of(context)!.localeName,
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
