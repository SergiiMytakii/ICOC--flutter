import 'package:flutter/material.dart';
import 'package:icoc/constants.dart';
import 'package:icoc/core/helpers/shared_preferences_helper.dart';
// import 'package:in_app_review/in_app_review.dart';
import 'package:rate_my_app/rate_my_app.dart';

class InAppReviewHelper {
  Future<bool> checkAndSaveFirstRunDate() async {
    final String? firstAppRunDate = await SharedPreferencesHelper.getString(
        SharedPreferencesKeys.firstAppRunDate);
    final now = DateTime.now();
    if (firstAppRunDate == null) {
      SharedPreferencesHelper.saveString(
          SharedPreferencesKeys.firstAppRunDate, now.toUtc().toString());
      return false;
    } else if (DateTime.parse(firstAppRunDate)
        .isBefore(now.add(Duration(days: 2)))) {
      return true;
    } else {
      return false;
    }
  }

  // void submitReview() async {
  //   final InAppReview inAppReview = InAppReview.instance;

  //   if (await inAppReview.isAvailable()) {
  //     inAppReview.requestReview();
  //   }
  // }
}

RateMyApp rateMyApp = RateMyApp(
  minDays: 0,
  minLaunches: 0,
  remindDays: 0,
  remindLaunches: 15,
  googlePlayIdentifier: 'ru.icoc.app',
  appStoreIdentifier: '1585486521',
);

void rateApp(BuildContext context) async {
  rateMyApp.init().then(
    (_) {
      if (rateMyApp.shouldOpenDialog) {
        rateMyApp.showStarRateDialog(
          context,
          ignoreNativeDialog: false,
          actionsBuilder: (context, stars) {
            return [
              // Return a list of actions (that will be shown at the bottom of the dialog).
              TextButton(
                child: Text('OK'),
                onPressed: () async {
                  await rateMyApp
                      .callEvent(RateMyAppEventType.rateButtonPressed);
                  Navigator.pop<RateMyAppDialogButton>(
                      context, RateMyAppDialogButton.rate);

                  if ((await rateMyApp.isNativeReviewDialogSupported) ??
                      false) {
                    await rateMyApp.launchNativeReviewDialog();
                  }
                  ;
                },
              ),
            ];
          },

          onDismissed: () => rateMyApp.callEvent(RateMyAppEventType
              .laterButtonPressed), // Called when the user dismissed the dialog (either by taping outside or by pressing the "back" button).
        );
      }
    },
  );
}
