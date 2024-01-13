import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../constants.dart';

class DeleteFromFavorites extends StatelessWidget {
  DeleteFromFavorites({
    Key? key,
    required this.songId,
  }) : super(key: key);

  // final FavoritesController favoritesController = Get.find();
  final int songId;

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
        label: 'delete from favorites'.tr(),
        backgroundColor: screensColors['songBook']!.withOpacity(0.7),
        icon: Icons.favorite_border,
        onPressed: (context) {}
        //  favoritesController.deleteFromFavorites(songId),
        );
  }
}

class AddToFavorites extends StatelessWidget {
  AddToFavorites({
    Key? key,
    required this.songId,
  }) : super(key: key);

  // final FavoritesController favoritesController =
  //     Get.put(FavoritesController());
  final int songId;

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
        label: 'to favorite'.tr(),
        backgroundColor: screensColors['songBook']!.withOpacity(0.5),
        icon: Icons.favorite_border,
        onPressed: (context) {}
        // favoritesController.addToFavorites(songId),
        );
  }
}
