import 'dart:io';
import 'package:flutter/cupertino.dart';
import '../../index.dart';

class AddSongFromPlaylist extends StatelessWidget {
  AddSongFromPlaylist(this.playlist);

  final controller = Get.put(PlaylistsController());
  final playlist;

  searchCustomAppBar(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).bottomAppBarColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: const Offset(
                1.0,
                1.0,
              ),
              blurRadius: 1.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        height: 60,
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'add to playlist'.tr),
                    controller: controller.textEditingController,
                    onChanged: (val) => controller.query.value = val,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.textEditingController.clear();
                  controller.query.value = '';
                },
                icon: Icon(
                  Icons.clear_outlined,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Platform.isIOS
          ? CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverToBoxAdapter(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CupertinoSearchTextField(
                    onChanged: (val) => controller.query.value = val,
                  ),
                )),
                // iosAppbar(context, controller, 'add to playlist'.tr),
                Obx(
                  () => DataSearchFromPlaylists(playlist)
                      .searchResults(controller.query.value),
                ),
              ],
            )
          : Column(children: [
              searchCustomAppBar(context),
              Container(
                height: Get.size.height / 1.15 -
                    MediaQuery.of(context).viewInsets.bottom -
                    80,
                child: Obx(
                  () => DataSearchFromPlaylists(playlist)
                      .searchResults(controller.query.value),
                ),
              ),
            ]),
    );
  }
}
