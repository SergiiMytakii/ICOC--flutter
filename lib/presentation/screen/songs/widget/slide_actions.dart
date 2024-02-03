import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:icoc/core/bloc/favorite_song_status_bloc/favorite_songs_bloc.dart';
import 'package:icoc/core/bloc/favorite_songs_list_bloc/favorite_songs_bloc.dart';
import 'package:icoc/presentation/widget/toast.dart';

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
        backgroundColor: ScreenColors.songBook,
        icon: Icons.favorite_border,
        onPressed: (context) {
          context.read<FavoriteSongStatusBloc>().add(
              SetFavoriteSongStatusRequested(id: songId, isFavorite: false));

          context
              .read<FavoriteSongsListBloc>()
              .add(FavoriteSongsListRequested());
        });
  }
}

class AddToFavorites extends StatelessWidget {
  AddToFavorites({
    Key? key,
    required this.songId,
  }) : super(key: key);

  final int songId;

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
        label: 'to favorite'.tr(),
        backgroundColor: ScreenColors.songBook,
        icon: Icons.favorite_border,
        onPressed: (context) {
          context.read<FavoriteSongStatusBloc>().add(
              SetFavoriteSongStatusRequested(id: songId, isFavorite: true));
          context
              .read<FavoriteSongsListBloc>()
              .add(FavoriteSongsListRequested());
          showToast(context: context, message: 'Added to favorite list'.tr());
        });
  }
}
