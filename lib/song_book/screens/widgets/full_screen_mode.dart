import '../../../index.dart';

class FullScreenMode extends StatefulWidget {
  const FullScreenMode({Key? key}) : super(key: key);

  @override
  State<FullScreenMode> createState() => _FullScreenModeState();
}

class _FullScreenModeState extends State<FullScreenMode> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp
    ]);
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('hi'),
    );
  }
}
