import '../../index.dart';

class OneQandAScreen extends StatelessWidget {
  OneQandAScreen({Key? key}) : super(key: key);
  final QandAController qandAController = Get.find<QandAController>();

  @override
  Widget build(BuildContext context) {
    var fontSozeAdjust = FontSizeAdjustBottomSheet(
        context: context, controller: qandAController, color: 'Q&A');
    int index = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'drawer_q_and_a'.tr,
        ),
        backgroundColor: screensColors['Q&A']!.withOpacity(0.8),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(
                Icons.text_fields_outlined,
              ),
              onPressed: () => fontSozeAdjust.bottomSheet()),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: qandAController.ansvers.isNotEmpty
            ? Column(
                children: [
                  Image.network(
                    qandAController.ansvers[index].photo,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                        child: CircularProgressIndicator.adaptive(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Obx(() => Text(
                        qandAController.ansvers[index].text,
                        style:
                            TextStyle(fontSize: qandAController.fontSize.value),
                      )),
                ],
              )
            : Loading(),
      ),
    );
  }
}
