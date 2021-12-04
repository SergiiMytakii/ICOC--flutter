import '../../index.dart';

class NotificationsScreen extends StatefulWidget {
  NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final MainScreenController controller = Get.find();

  final GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    int i = 0;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notifications'.tr),
          centerTitle: true,
        ),
        body: Obx(
          () => ListView.builder(
              itemCount: controller.notifications.length,
              itemBuilder: (BuildContext context, index) {
                if (i < 4) {
                  i++;
                } else {
                  i = 0;
                }

                return Column(
                  children: [
                    ListTile(
                      onTap: () =>
                          _markAsRead(controller.notifications[index].text),
                      contentPadding: EdgeInsets.all(8),
                      leading: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        child: CircleAvatar(
                          backgroundColor: !controller.checkIsRead(
                                  controller.notifications[index].text)
                              ? Theme.of(context).primaryColor
                              : Colors.transparent,
                          child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Theme.of(context).primaryColor),
                              ),
                              child: Center(child: Text('i'))),
                        ),
                      ),
                      title: Text(controller.notifications[index].title),
                      subtitle: Text(
                        controller.notifications[index].text,
                      ),
                    ),
                    Divider(
                      indent: 50,
                      color: dividerColors[i],
                      thickness: 1.2,
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }

  _markAsRead(String text) async {
    Map? cash = box.read('notifications') ?? {};

    if (cash.values.contains(text))
      return;
    else
      cash[DateTime.now().toString()] = text;
    await box.write('notifications', cash);
    controller.amountNotifications.value -= 1;
    setState(() {});
  }
}
