import '../../../index.dart';

class AndroidAppBar extends StatelessWidget {
  const AndroidAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      primary: true,
      title: Text(
        'app_bar_title'.tr,
      ),
      centerTitle: true,
      backgroundColor: screensColors['songBook'],
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          tooltip: 'icon_button_actions_app_bar_filter'.tr,
          onPressed: () {
            Get.back();
          }),
      actions: [
        buildFilterButton(context),
        buildSearchButton(context),
        buildAddSongButton(context)
      ],
      pinned: true,
    );
  }

  IconButton buildSearchButton(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          showSearch(context: context, delegate: DataSearch());
        });
  }
}
