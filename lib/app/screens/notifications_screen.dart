import '../../index.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({Key? key}) : super(key: key);
  final MainScreenController controller = Get.find();
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
                      contentPadding: EdgeInsets.all(8),
                      leading: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        child: CircleAvatar(
                          child: Text('I'),
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
}
