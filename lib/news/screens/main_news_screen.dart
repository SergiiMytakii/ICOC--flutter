import '../../index.dart';

class MainNewsScreen extends StatelessWidget {
  //final KyivInstaNewsController controller = Get.put(KyivInstaNewsController());
  final NewsController newsController = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'drawer_news'.tr,
        ),
        backgroundColor: screensColors['news']!.withOpacity(0.8),
        centerTitle: true,
        actions: [],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _item(
                    context,
                    Routes.ICOC_RU_NEWS,
                    Image.asset(
                      'assets/images/icocRu.png',
                      fit: BoxFit.contain,
                    ),
                    '',
                    Color(0xFF4a76a8),
                  ),
                  //Not works due to instagram changes
                  // _item( 
                  //   context,
                  //   Routes.KYIV_INSTA_NEWS,
                  //   Image.asset(
                  //     'assets/images/kyivInsta.png',
                  //     fit: BoxFit.contain,
                  //   ),
                  //   'Kyiv Church of Christ',
                  //   screensColors['news']!,
                  // ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'use vpn if something not works'.tr,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _item(BuildContext context, String routeName, Widget picture,
      String description, Color color) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(12),
      child: InkWell(
        onTap: () => Get.toNamed(routeName),
        splashColor: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              picture,
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Text(
                  description,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.white),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.6),
                color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
