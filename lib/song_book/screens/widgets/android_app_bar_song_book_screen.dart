import '/index.dart';

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
        IconButton(
          icon: Icon(
            Icons.filter_alt_outlined,
          ),
          tooltip: 'icon_button_actions_app_bar_filter'.tr,
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                enableDrag: true,
                barrierColor: Colors.black.withOpacity(0.2),
                builder: (BuildContext context) {
                  return ModalBottomSheet(
                      height: Get.size.height / 1.8,
                      blurBackground: false,
                      child: BottomSheetFilter());
                });
          },
        ),
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            })
      ],
      pinned: true,
    );
  }
}
