import '/index.dart';

class BottomSheetFilter extends StatelessWidget {
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
          height: 300,
          child: Column(
            children: [
              FittedBox(
                child: Text(
                  'icon_button_actions_app_bar_filter'.tr,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Container(
                height: 200,
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
              FittedBox(
                child: Text('hint reorder lang'.tr),
              )
            ],
          ),
        );
      },
    );
  }
}
