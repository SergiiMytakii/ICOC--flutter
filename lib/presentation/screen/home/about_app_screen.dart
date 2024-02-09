import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants.dart';
import '../../widget/custom_button.dart';
import '../../widget/toast.dart';

class AboutAppScreen extends StatefulWidget {
  @override
  State<AboutAppScreen> createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {
  @override
  void initState() {
    FirebaseAnalytics.instance.logScreenView(screenName: 'About App Screen');
    super.initState();
  }

  Future launchEmail(BuildContext context) async {
    final uri = Uri(scheme: 'mailto', path: email, query: 'subject=ICOC app');

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else
      showToast(
          context: context,
          title: 'Error'.tr(),
          message: 'Can\'t open Email app'.tr());
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
              height: 10,
            ),
            Text(
              'ICOC',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: ScreenColors.general, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Church of Christ'.tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),

            SizedBox(
              height: 10,
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
              height: 20,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Text(
            //       'Ищем контент менеджера для добавления аудио и видео к песням. \n Если Бог положил вам такое на сердце - напишите нам об этом!'),
            // ),

            Text(
              'Wishes and suggestions: '.tr(),
              style: Theme.of(context).textTheme.bodyLarge,
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

            supportProjectBlock(context),
          ],
        ),
      ),
    );
  }

  Future<void> _copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    showToast(context: context, message: 'Copied to clipboard'.tr());
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
                FirebaseAnalytics.instance
                    .logPurchase(currency: 'support project clicked');
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
          height: isOpened ? 300 : 0,
          width: double.maxFinite,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                      width: 6,
                    ),
                    _buildCredentialsField(context, monoBankCard),
                    Expanded(child: SizedBox()),
                    _buildCopyButton(context, monoBankCard),
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
                    width: 6,
                  ),
                  _buildCredentialsField(context, payPalAccount),
                  Expanded(
                    child: Container(),
                  ),
                  _buildCopyButton(context, payPalAccount),
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
                  Text('USDT TRC20:'.tr()),
                  SizedBox(
                    width: 6,
                  ),
                  _buildCredentialsField(context, usdtWallet),
                  Expanded(
                    child: Container(),
                  ),
                  _buildCopyButton(context, usdtWallet),
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }

  SizedBox _buildCredentialsField(BuildContext context, String credentials) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.5,
      child: AutoSizeText(
        credentials,
        minFontSize: 8,
        maxFontSize: 12,
        maxLines: 2,
      ),
    );
  }

  AnimatedOpacity _buildCopyButton(BuildContext context, String value) {
    return AnimatedOpacity(
      opacity: _opacity ? 0 : 1,
      duration: Duration(milliseconds: 800),
      child: IconButton(
          onPressed: () {
            _copyToClipboard(value);
          },
          icon: Icon(
            Icons.copy_outlined,
            size: 16,
            color: AdaptiveTheme.of(context).theme.primaryIconTheme.color,
          )),
    );
  }
}
