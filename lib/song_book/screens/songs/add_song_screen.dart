import '/index.dart';

class AddSongScreen extends StatefulWidget {
  @override
  State<AddSongScreen> createState() => _AddSongScreenState();
}

class _AddSongScreenState extends State<AddSongScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController textController = TextEditingController();
  final TextEditingController linkController = TextEditingController();
  bool valid = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New song'.tr),
        backgroundColor: screensColors['songBook'],
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        // height: Get.size.height,
        child: ListView(
          children: [
            Center(
              child: Text(
                'add_song'.tr,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: titleController,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                errorText: valid ? null : 'Add title'.tr,
                labelText: 'Title'.tr,
                hintText: 'Add here title of the song'.tr,
                hintStyle: TextStyle(fontSize: 14),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: screensColors['songBook']!)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: descriptionController,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                labelText: 'Description'.tr,
                hintText: 'Add here information like author, church etc...'.tr,
                hintStyle: TextStyle(fontSize: 14),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: screensColors['songBook']!)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              maxLines: 5,
              controller: textController,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                errorText: valid ? null : 'Add text'.tr,
                labelText: 'Text and chords'.tr,
                hintText: 'Add here text of the song, chords'.tr,
                hintStyle: TextStyle(fontSize: 14),
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: screensColors['songBook']!)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: linkController,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                labelText: 'Link'.tr,
                hintText: 'Add here link'.tr,
                hintStyle: TextStyle(fontSize: 14),
                hintMaxLines: 2,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: screensColors['songBook']!)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () => sendEmail(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Send'.tr),
                ],
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(screensColors['songBook']!)),
            )
          ],
        ),
      ),
    );
  }

  void sendEmail(BuildContext context) async {
    if (titleController.text.isEmpty || textController.text.isEmpty) {
      setState(() {
        valid = false;
      });
      return;
    } else {
      setState(() {
        valid = true;
      });
    }

    final body = 'title:  ' +
        titleController.text +
        ' ________________________________________________ ' +
        'Description:  ' +
        descriptionController.text +
        ' ________________________________________________ ' +
        'Link: ' +
        linkController.text +
        ' ________________________________________________ ' +
        'Text :  ' +
        textController.text;
    final uri = Uri(
        scheme: 'mailto', path: email, query: 'subject=ICOC app&body=$body');

    if (await canLaunchUrl(uri)) {
      final result = await launchUrl(uri);
      if (result) {
        showSnackbar('', 'Email has been sent'.tr);
        await Future.delayed(Duration(seconds: 1));
        Navigator.pop(context);
      }
    } else
      showSnackbar('Error'.tr, 'Can\'t open Email app'.tr);
  }
}
