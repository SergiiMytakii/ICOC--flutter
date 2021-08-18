import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getxfire/getxfire.dart';
import 'package:icoc/shared/constants.dart';
import 'package:icoc/song_book/logic/controllers/slides_controller.dart';

class SlidesScreen extends StatefulWidget {
  @override
  _SlidesScreenState createState() => _SlidesScreenState();
}

class _SlidesScreenState extends State<SlidesScreen> {
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SlidesController());
    return Scaffold(
      //todo landscape mode
      appBar: AppBar(
        backgroundColor: Constants.screensColors['songBook'],
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
