import '../../index.dart';

class ShareAppScreen extends StatefulWidget {
  const ShareAppScreen({Key? key}) : super(key: key);

  @override
  State<ShareAppScreen> createState() => _ShareAppScreenState();
}

class _ShareAppScreenState extends State<ShareAppScreen> {
  bool _isGoogleOpened = false;
  bool _isIosOpened = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share this app'.tr),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _shareCard(appUrlPlayMarket, 'assets/images/googlePlayIcon.jpeg',
                  'google_play'),
              SizedBox(
                height: 16,
              ),
              _shareCard(appUrlAppStore, 'assets/images/appStoreIcon.jpeg',
                  'app_store'),
              SizedBox(
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _shareCard(String link, String image, String store) {
    return Column(
      children: [
        Row(
          children: [
            Container(width: 150, child: Image.asset(image)),
            SizedBox(
              width: 6,
            ),
            Column(
              children: [
                //
                Container(
                  width: Get.size.width - 200,
                  child: Column(
                    children: [
                      Text(
                        link,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomButton(
                          child: Text(
                            'Share link'.tr,
                          ),
                          onPressed: () => Share.share(link),
                          color: screensColors['general']!),
                      CustomButton(
                          onPressed: () => setState(() {
                                if (store == 'google_play') {
                                  _isGoogleOpened = !_isGoogleOpened;
                                }
                                if (store == 'app_store') {
                                  _isIosOpened = !_isIosOpened;
                                }
                              }),
                          child: Text('QR code'.tr),
                          color: screensColors['general']!),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 800),
          height: store == 'google_play'
              ? _isGoogleOpened
                  ? Get.width - 32
                  : 0
              : _isIosOpened
                  ? Get.width - 32
                  : 0,
          width: double.maxFinite,
          margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          padding: EdgeInsets.all(8),
          curve: Curves.fastOutSlowIn,
          child: Center(
            child: QrImage(
              data: link,
              version: QrVersions.auto,
            ),
          ),
        ),
      ],
    );
  }
}
