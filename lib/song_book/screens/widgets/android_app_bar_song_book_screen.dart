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
                // backgroundColor: Theme.of(context)
                //     .bottomSheetTheme
                //     .backgroundColor!
                //     .withOpacity(0.1),
                barrierColor: Colors.black.withOpacity(0.2),
                builder: (BuildContext context) {
                  return ModalBottomSheet(
                      height: 380,
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
