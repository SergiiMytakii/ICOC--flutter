import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icoc/presentation/widget/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:icoc/core/constants.dart';
import 'package:icoc/core/helpers/app_toast.dart';

class AddSongScreen extends StatefulWidget {
  const AddSongScreen({super.key});

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
        title: Text('New song'.tr()),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        // height: Get.size.height,
        child: ListView(
          children: [
            Center(
              child: Text(
                'add_song'.tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: titleController,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8),
                errorText: valid ? null : 'Add title'.tr(),
                labelText: 'Title'.tr(),
                hintText: 'Add here title of the song'.tr(),
                hintStyle: const TextStyle(fontSize: 14),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: ScreenColors.songBook)),
                disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: descriptionController,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8),
                labelText: 'Description'.tr(),
                hintText:
                    'Add here information like author, church etc...'.tr(),
                hintStyle: const TextStyle(fontSize: 14),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: ScreenColors.songBook)),
                disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              maxLines: 5,
              controller: textController,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8),
                errorText: valid ? null : 'Add text'.tr(),
                labelText: 'Text and chords'.tr(),
                hintText: 'Add here text of the song, chords'.tr(),
                hintStyle: const TextStyle(fontSize: 14),
                alignLabelWithHint: true,
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: ScreenColors.songBook)),
                disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: linkController,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8),
                labelText: 'Link'.tr(),
                hintText: 'Add here link'.tr(),
                hintStyle: const TextStyle(fontSize: 14),
                hintMaxLines: 2,
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: ScreenColors.songBook)),
                disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            CustomButton(
              onPressed: () => sendEmail(context),
              color: ScreenColors.songBook,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Send'.tr(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              'suggestion to get admin panel'.tr(),
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
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

    // ignore: prefer_interpolation_to_compose_strings
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
        if (context.mounted) {
          AppToast.show(context,
              title: 'Email'.tr(), body: 'Email has been sent'.tr());
          await Future.delayed(const Duration(seconds: 1));
          context.pop();
        }
      }
    } else if (context.mounted) {
      AppToast.show(context,
          title: 'Error'.tr(), body: 'Can\'t open Email app'.tr());
    }
  }
}
