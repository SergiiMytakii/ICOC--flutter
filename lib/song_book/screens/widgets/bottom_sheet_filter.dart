import '/index.dart';

class BottomSheetFilter extends StatefulWidget {
  @override
  State<BottomSheetFilter> createState() => _BottomSheetFilterState();
}

class _BottomSheetFilterState extends State<BottomSheetFilter> {
  final SongsController songsController = Get.find();
  final GetStorage box = GetStorage();
  late bool byNumber;
  late bool byTitle;
  @override
  void initState() {
    byNumber = box.read('sortByNumber') ?? true;
    byTitle = !byNumber;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderLangController>(
      init: OrderLangController(),
      builder: (controller) {
        void _onReorder(int oldIndex, int newIndex) {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          //move item to the new position
          final String item = controller.orderLang.removeAt(oldIndex);
          controller.orderLang.insert(newIndex, item);
          //writing new order of lang-s to preferences
          controller.setOrderLang();
        }

        return Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          height: Get.size.height / 2.1,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Center(
                  child: Text(
                    'Sort by'.tr,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _sortButton(context, 'By number'.tr, () {
                    box.write('sortByNumber', true);
                    setState(() {
                      byNumber = true;
                      byTitle = false;
                      _orderSongs(controller, byNumber);
                    });
                  }, byNumber),
                  _sortButton(context, 'By tittle'.tr, () {
                    box.write('sortByNumber', false);
                    setState(() {
                      byNumber = false;
                      byTitle = true;
                      _orderSongs(controller, byNumber);
                    });
                  }, byTitle)
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(
                  thickness: 1.5,
                ),
              ),
              FittedBox(
                child: Text(
                  'icon_button_actions_app_bar_filter'.tr,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Container(
                height: 175,
                margin: EdgeInsets.only(top: 10),
                child: ReorderableListView(
                  scrollDirection: Axis.vertical,
                  onReorder: _onReorder,
                  children: List.generate(controller.orderLang.length, (index) {
                    return MyCheckboxListTile(
                        controller.orderLang[index], ValueKey('$index'));
                  }),
                ),
              ),
              Text(
                'hint reorder lang'.tr,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: screensColors['songBook']),
                textAlign: TextAlign.center,
              )
            ],
          ),
        );
      },
    );
  }

  _sortButton(BuildContext context, String title, Function onTap, bool by) {
    Color active = screensColors['songBook']!;
    Color unActive = Theme.of(context).canvasColor;
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        height: 36,
        width: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
            color: by ? active : unActive,
            borderRadius: BorderRadius.all(Radius.circular(4)),
            border: Border.all(color: active)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: by ? unActive : active, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  void _orderSongs(OrderLangController controller, bool sortByNumber) {
    if (sortByNumber)
      songsController.songsFromFB.sort((a, b) => a.id.compareTo(b.id));
    else
      songsController.songsFromFB.sort((a, b) => controller
          .chooseCardLang(a)![0]!
          .compareTo(controller.chooseCardLang(b)![0]!));
  }
}
