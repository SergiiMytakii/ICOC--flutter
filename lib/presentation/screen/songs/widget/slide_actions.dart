import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/favorite_song_status_bloc/favorite_songs_bloc.dart';
import 'package:icoc/presentation/bloc/favorite_songs_list_bloc/favorite_songs_bloc.dart';
import 'package:icoc/presentation/widget/toast.dart';

import 'package:icoc/constants.dart';

class DeleteFromFavorites extends StatelessWidget {
  DeleteFromFavorites({
    super.key,
    required this.songId,
  });

  // final FavoritesController favoritesController = Get.find();
  final int songId;

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
        label: 'delete from favorites'.tr(),
        backgroundColor: ScreenColors.songBook,
        icon: Icons.favorite_border,
        onPressed: (context) {
          getIt<FavoriteSongStatusBloc>().add(
              SetFavoriteSongStatusRequested(id: songId, isFavorite: false));

          getIt<FavoriteSongsListBloc>().add(FavoriteSongsListRequested());
        });
  }
}

class AddToFavorites extends StatelessWidget {
  AddToFavorites({
    super.key,
    required this.songId,
  });

  final int songId;

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
        label: 'to favorite'.tr(),
        backgroundColor: ScreenColors.songBook,
        icon: Icons.favorite_border,
        onPressed: (context) {
          getIt<FavoriteSongStatusBloc>().add(
              SetFavoriteSongStatusRequested(id: songId, isFavorite: true));
          getIt<FavoriteSongsListBloc>().add(FavoriteSongsListRequested());
          showToast(context: context, message: 'Added to favorite list'.tr());
        });
  }
}
