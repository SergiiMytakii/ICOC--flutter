import '/index.dart';

class MyCheckboxListTile extends StatelessWidget {
  final ValueKey key;
  final String orderLang;
  final SongsController controller = Get.find();
  MyCheckboxListTile(this.orderLang, this.key);

  @override
  Widget build(BuildContext context) {
    String lang = orderLang;

    return GetBuilder<SongLangController>(
      init: SongLangController(),
      builder: (songLangController) {
        return Container(
          child: CheckboxListTile(
              activeColor: screensColors['songBook'],
              key: key,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                lang.tr,
                style: Theme.of(context).textTheme.headline6,
              ),
              value: songLangController.songLang[lang],
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              secondary: Icon(
                Icons.reorder,
                color: screensColors['songBook'],
              ),
              onChanged: (val) {
                songLangController.setSongLang(lang, val);
                controller.fetchDataFromFirebase();
                Get.appUpdate();
              }),
        );
      },
    );
  }
}