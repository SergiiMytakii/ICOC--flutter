import '/index.dart';

class FontSizeAdjustBottomSheet {
  final BuildContext context;
  final String color;
  var controller;
  bool needForce;

  FontSizeAdjustBottomSheet(
      {required this.context,
      this.controller,
      required this.color,
      this.needForce = false});

  bottomSheet() {
    return Get.bottomSheet(Container(
        padding: EdgeInsets.all(16),
        height: 200,
        color: Theme.of(context)
            .bottomSheetTheme
            .backgroundColor!
            .withOpacity(0.8),
        child: Column(children: [
          Text(
            'Font size'.tr,
            style: Theme.of(context).textTheme.headline6,
          ),
          Container(
            alignment: Alignment.center,
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Obx(() => Row(
                  children: [
                    Container(
                      width: 80,
                      child: Text(
                        'aA',
                        style: TextStyle(fontSize: controller.fontSize.value),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: Get.size.width - 200,
                      child: Slider.adaptive(
                        activeColor: screensColors[color],
                        inactiveColor: screensColors[color],
                        label: 'Font size',
                        value: controller!.fontSize.value,
                        min: 14,
                        max: 48,
                        divisions: 34,
                        onChanged: (val) => needForce
                            ? controller!.altFontSizeForce(val)
                            : controller!.altFontSize(val),
                      ),
                    ),
                  ],
                )),
          ),
        ])));
  }
}