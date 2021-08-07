import 'package:flutter/material.dart';
import 'package:getxfire/getxfire.dart';
import 'package:icoc/shared/constants.dart';
import 'package:icoc/song_book/logic/controllers/slides_controller.dart';

class SlidesScreen extends GetView<SlidesController> {
  final Size size = Get.size;

  @override
  Widget build(BuildContext context) {
    Get.put(SlidesController());
    return Scaffold(
      //todo landscape mode
      appBar: AppBar(
        backgroundColor: Constants.screensColors['songBook']!.withOpacity(0.8),
      ),
      body: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.all(8),
          color: Colors.black,
          child: Obx(() => FittedBox(
                child: Text(
                  controller.slide,
                  style: TextStyle(color: Colors.white),
                ),
              ))),
    );
  }
}
