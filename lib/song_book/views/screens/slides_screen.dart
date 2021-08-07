import 'package:flutter/material.dart';
import 'package:getxfire/getxfire.dart';
import 'package:icoc/song_book/logic/controllers/slides_controller.dart';

class SlidesScreen extends GetView<SlidesController> {
  const SlidesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SlidesController());
    return Scaffold(
      body: Container(),
    );
  }
}
