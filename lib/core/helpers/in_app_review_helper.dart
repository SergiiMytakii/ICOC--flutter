import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';

RateMyApp rateMyApp = RateMyApp(
  minDays: 3,
  minLaunches: 3,
  remindDays: 7,
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
