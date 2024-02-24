import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants.dart';

class TermsOfUseAndPolicy extends StatelessWidget {
  const TermsOfUseAndPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Terms of Use'.tr(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: 'terms of use part1'.tr(),
                  style: Theme.of(context).textTheme.bodyLarge),
              TextSpan(
                text: 'terms of use part2'.tr(),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.blue, decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    launchUrl(Uri.parse(YOUTUBE_TERMS_OF_SERVISES));
                  },
              ),
              TextSpan(
                text: 'terms of use part3'.tr(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              TextSpan(text: '''


'''),
              TextSpan(
                  text: 'Privacy policy1'.tr(),
                  style: Theme.of(context).textTheme.titleLarge),
              TextSpan(
                  text: 'Privacy policy2'.tr(),
                  style: Theme.of(context).textTheme.bodyLarge),
              TextSpan(
                text: 'Privacy policy3'.tr(),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.blue, decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    launchUrl(Uri.parse(YOUTUBE_PRIVACY_POLICIES));
                  },
              ),
              TextSpan(
                text: 'Privacy policy4'.tr(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
