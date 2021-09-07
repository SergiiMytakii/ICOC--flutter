import '../../index.dart';

class AboutAppScreen extends StatelessWidget {
  Future launchEmail() async {
    final url = 'mailto:$email?';

    if (await canLaunch(url)) {
      await launch(url);
    } else
      showSnackbar('Error', 'Can\'t open Email app');
  }

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
      body: Container(
        height: Get.size.height,
        width: Get.size.width,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'ICOC',
              style: Theme.of(context).textTheme.headline4,
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
              'Sergii Gaponov'.tr,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Text(
              'Sergii Mytakii'.tr,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Text(
              'Antonina Glajevskaya'.tr,
              style: Theme.of(context).textTheme.bodyText2,
            ),
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
                  color: Theme.of(context).primaryColor,
                ),
                TextButton(
                  child: Text(
                    '$email'.tr,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                  onPressed: () => launchEmail(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
