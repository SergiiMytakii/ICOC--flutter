import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getxfire/getxfire.dart';
import 'package:icoc/song_book/logic/controllers/slides_controller.dart';
import 'package:icoc/song_book/views/widgets/font_size_adjust_bottom_sheet.dart';

class SlidesScreen extends StatefulWidget {
  @override
  _SlidesScreenState createState() => _SlidesScreenState();
}

class _SlidesScreenState extends State<SlidesScreen> {
  final controller = Get.put(SlidesController());
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft
    ]);
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
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.question))
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      slidesButton(width, controller.getPreviosSlide),
                      slidesButton(width, controller.getNextSlide),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }

  InkWell slidesButton(double width, onTapHandler) {
    return InkWell(
      customBorder: CircleBorder(),
      splashColor: Colors.black,
      borderRadius: BorderRadius.circular(15),
      onTap: onTapHandler,
      child: Container(
        width: width * 0.3,
      ),
    );
  }
}
