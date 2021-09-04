import '../../index.dart';

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'drawer_news'.tr,
        ),
        backgroundColor: screensColors['news']!.withOpacity(0.8),
        centerTitle: true,
      ),
      body: Center(
        child: Text('There is nothing here yet...'),
      ),
    );
  }
}
