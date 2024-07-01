import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:icoc/constants.dart';

class NoContentWarning extends StatelessWidget {
  const NoContentWarning({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 200,
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            "Unfortunately, there isn't any content here in".tr() +
                ' ${languagesCodes[context.locale.languageCode]}. ' +
                'Add more languages in the filter.'.tr(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
