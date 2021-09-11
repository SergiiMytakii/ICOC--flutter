import 'package:flutter/cupertino.dart';
import '/index.dart';

class SlidesScreen extends StatefulWidget {
  @override
  _SlidesScreenState createState() => _SlidesScreenState();
}

class _SlidesScreenState extends State<SlidesScreen> {
  final controller = Get.put(SlidesController());
  @override
  void initState() {
    Wakelock.enable();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft
    ]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    controller.line = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    var fontSizeAdjust =
        FontSizeAdjustBottomSheet(context: context, controller: controller);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () => fontSizeAdjust.bottomSheet(),
              icon: Icon(Icons.settings_outlined)),
          IconButton(
              onPressed: () {
                controller.revealHint();
              },
              icon: Icon(CupertinoIcons.question))
        ],
      ),
      body: Stack(
        children: [
          Container(
            width: width,
            height: height,
            padding: EdgeInsets.all(8),
            color: Colors.black,
            child: Obx(
              () => Text(
                controller.slide.value,
                style: TextStyle(
                    color: Colors.white, fontSize: controller.fontSize.value),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
              bottom: 10,
              left: 10,
              child: Container(
                height: height * 0.15,
                width: width,
                child: Material(
                  color: Colors.transparent,
                  child: Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          slidesButton(width, controller.getPreviosSlide,
                              controller.hintColorBack.value),
                          Icon(
                            Icons.arrow_back,
                            color: controller.hintColorBack.value,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: controller.hintColorForward.value,
                          ),
                          slidesButton(width, controller.getNextSlide,
                              controller.hintColorForward.value),
                        ],
                      )),
                ),
              ))
        ],
      ),
    );
  }

  InkWell slidesButton(double width, onTapHandler, Color color) {
    return InkWell(
      customBorder: CircleBorder(),
      splashColor: Colors.black,
      borderRadius: BorderRadius.circular(15),
      onTap: onTapHandler,
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        width: width * 0.3,
      ),
    );
  }
}
