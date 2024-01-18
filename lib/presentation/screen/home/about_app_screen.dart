import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants.dart';
import '../../widget/custom_button.dart';
import '../../widget/snackbar.dart';

class AboutAppScreen extends StatefulWidget {
  @override
  State<AboutAppScreen> createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {
  // Future launchEmail() async {
  //   final url = 'mailto:$email?';

  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else
  //     showSnackbar('Error'.tr, 'Can\'t open Email app'.tr);
  // }
  Future launchEmail(BuildContext context) async {
    final uri = Uri(scheme: 'mailto', path: email, query: 'subject=ICOC app');

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else
      showSnackbar(context, 'Error'.tr(), 'Can\'t open Email app'.tr());
  }

  bool isOpened = false;
  bool _opacity = true;
  final dataKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About this app'.tr(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'ICOC',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: screensColors['general'], fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Church of Christ'.tr(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Version $versionApp'.tr(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Created by:'.tr(),
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Sergii Mytakii'.tr(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'Sergii Gaponov'.tr(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'Antonina Glajevskaya'.tr(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'Oksana Strelchenya'.tr(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'Loginova Irina'.tr(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            SizedBox(
              height: 30,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Text(
            //       'Ищем контент менеджера для добавления аудио и видео к песням. \n Если Бог положил вам такое на сердце - напишите нам об этом!'),
            // ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Wishes and suggestions: '.tr(),
              style: Theme.of(context).textTheme.bodyMedium,
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
                    '$email'.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.blueAccent),
                  ),
                  onPressed: () => launchEmail(context),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            supportProjectBlock(context),
          ],
        ),
      ),
    );
  }

  Future<void> _copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    showSnackbar(context, '', 'Copied to clipboard'.tr());
  }

  supportProjectBlock(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Text(
              'If you like this app and want it to be constantly improved and developed - you can support the project!'
                  .tr(),
              style: Theme.of(context).textTheme.bodyMedium,
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
            },
            child: Text(
              'Support ptoject'.tr(),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 800),
          height: isOpened ? 250 : 0,
          width: double.maxFinite,
          margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          padding: EdgeInsets.all(8),
          curve: Curves.fastOutSlowIn,
          child: Column(children: [
            Flexible(
                child: Text(
              'In Ukraine:'.tr(),
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Text(
                      'MonoBank card:'.tr(),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      monoBankCard,
                    ),
                    Expanded(child: SizedBox()),
                    AnimatedOpacity(
                      opacity: _opacity ? 0 : 1,
                      duration: Duration(milliseconds: 800),
                      child: IconButton(
                        onPressed: () {
                          _copyToClipboard(monoBankCard);
                        },
                        icon: Icon(Icons.copy_outlined),
                        color: AdaptiveTheme.of(context)
                            .theme
                            .primaryIconTheme
                            .color,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
                child: Text(
              'Out from Ukraine:'.tr(),
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            Flexible(
              child: Row(
                children: [
                  Text('PayPal:'.tr()),
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
                          color: AdaptiveTheme.of(context)
                              .theme
                              .primaryIconTheme
                              .color,
                        )),
                  ),
                ],
              ),
            ),
            Flexible(
                child: Text(
              'From everywhere:'.tr(),
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            Flexible(
              child: Row(
                children: [
                  Text('USDT wallet:'.tr()),
                  SizedBox(
                    width: 12,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: AutoSizeText(
                      usdtWallet,
                      minFontSize: 8,
                      maxFontSize: 12,
                      maxLines: 2,
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  AnimatedOpacity(
                    opacity: _opacity ? 0 : 1,
                    duration: Duration(milliseconds: 800),
                    child: IconButton(
                        onPressed: () {
                          _copyToClipboard(usdtWallet);
                        },
                        icon: Icon(
                          Icons.copy_outlined,
                          color: AdaptiveTheme.of(context)
                              .theme
                              .primaryIconTheme
                              .color,
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
