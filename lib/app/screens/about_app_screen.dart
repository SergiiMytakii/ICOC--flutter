import '../../index.dart';

class AboutAppScreen extends StatefulWidget {
  @override
  State<AboutAppScreen> createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {
  Future launchEmail() async {
    final url = 'mailto:$email?';

    if (await canLaunch(url)) {
      await launch(url);
    } else
      showSnackbar('Error'.tr, 'Can\'t open Email app'.tr);
  }

  bool isOpened = false;
  bool _opacity = true;
  final dataKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About this app'.tr,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'ICOC',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: screensColors['general'], fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Church of Christ'.tr,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Version $versionApp'.tr,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Created by:'.tr,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Sergii Mytakii'.tr,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Text(
              'Sergii Gaponov'.tr,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Text(
              'Antonina Glajevskaya'.tr,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(
              height: 40,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Text(
            //       'Ищем контент менеджера для добавления аудио и видео к песням. \n Если Бог положил вам такое на сердце - напишите нам об этом!'),
            // ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Wishes and suggestions: '.tr,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.email_outlined,
                  color: Colors.blueAccent,
                ),
                TextButton(
                  child: Text(
                    '$email'.tr,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.blueAccent),
                  ),
                  onPressed: () => launchEmail(),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            supportProjectBlock(context),
            Container(
              height: 10,
              key: dataKey,
            )
          ],
        ),
      ),
    );
  }

  Future<void> _copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    showSnackbar('', 'Copied to clipboard'.tr);
  }

  supportProjectBlock(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Text(
              'If you like this app and want it to be constantly improved and developed - you can support the project!'
                  .tr,
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.center),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: CustomButton(
              onPressed: () async {
                setState(() {
                  isOpened = !isOpened;

                  _opacity = !_opacity;
                });
                if (isOpened) {
                  await Future.delayed(Duration(milliseconds: 500));
                  Scrollable.ensureVisible(dataKey.currentContext!);
                }
              },
              child: Text('Support ptoject'.tr),
              color: screensColors['general']!),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 800),
          height: isOpened ? 250 : 0,
          width: double.maxFinite,
          margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          padding: EdgeInsets.all(8),
          curve: Curves.fastOutSlowIn,
          child: Column(children: [
            Flexible(child: Text('In Ukraine:'.tr)),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'MonoBank card:'.tr,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      monoBankCard,
                    ),
                    AnimatedOpacity(
                      opacity: _opacity ? 0 : 1,
                      duration: Duration(milliseconds: 800),
                      child: IconButton(
                        onPressed: () {
                          _copyToClipboard(monoBankCard);
                        },
                        icon: Icon(Icons.copy_outlined),
                        color: Theme.of(context).primaryIconTheme.color,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(child: Text('Out from Ukraine:'.tr)),
            Flexible(
              child: Row(
                children: [
                  Text('PayPal:'.tr),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    payPalAccount,
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  AnimatedOpacity(
                    opacity: _opacity ? 0 : 1,
                    duration: Duration(milliseconds: 800),
                    child: IconButton(
                        onPressed: () {
                          _copyToClipboard(payPalAccount);
                        },
                        icon: Icon(
                          Icons.copy_outlined,
                          color: Theme.of(context).primaryIconTheme.color,
                        )),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
