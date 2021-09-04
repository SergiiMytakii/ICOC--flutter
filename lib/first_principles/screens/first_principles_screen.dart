import '../../index.dart';

class FirstPrinciples extends StatelessWidget {
  const FirstPrinciples({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'drawer_first_principles'.tr,
        ),
        backgroundColor:
            Constants.screensColors['firstPrinciples']!.withOpacity(0.8),
        centerTitle: true,
      ),
      body: Center(
        child: Text('There is nothing here yet...'),
      ),
    );
  }
}
