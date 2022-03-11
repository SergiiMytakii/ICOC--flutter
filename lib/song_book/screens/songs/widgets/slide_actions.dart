import '../../../../index.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AddToPlayList extends StatelessWidget {
  const AddToPlayList({
    Key? key,
    required this.songId,
  }) : super(key: key);

  final int songId;

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      label: 'to playlist'.tr,
      backgroundColor: screensColors['songBook']!.withOpacity(0.81),
      icon: Icons.playlist_play_outlined,
      onPressed: (context) {
        showModalBottomSheet(
          context: Get.context!,
          isScrollControlled: true,
          enableDrag: true,
          backgroundColor: Colors.transparent,
          barrierColor: Colors.black.withOpacity(0.2),
          builder: (context) => ModalBottomSheet(
            child: AddSongToPlaylistsScreen(songId),
          ),
        );
      },
    );
  }
}

class DeleteFromFavorites extends StatelessWidget {
  DeleteFromFavorites({
    Key? key,
    required this.songId,
  }) : super(key: key);

  final FavoritesController favoritesController = Get.find();
  final int songId;

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      label: 'delete from favorites'.tr,
      backgroundColor: screensColors['songBook']!.withOpacity(0.7),
      icon: Icons.favorite_border,
      onPressed: (context) => favoritesController.deleteFromFavorites(songId),
    );
  }
}

class RemoveFromPlaylist extends StatelessWidget {
  RemoveFromPlaylist({
    Key? key,
    required this.playlistId,
    required this.songId,
  }) : super(key: key);

  final PlaylistsController playlistsController = Get.find();
  final int? playlistId;
  final int songId;

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
        label: 'remove from playlist'.tr,
        backgroundColor: screensColors['songBook']!,
        icon: Icons.remove_circle_outline_outlined,
        onPressed: (context) {
          if (playlistId != null) {
            playlistsController.removeFromPlaylist(playlistId!, songId);
          }
        });
  }
}

class AddToFavorites extends StatelessWidget {
  AddToFavorites({
    Key? key,
    required this.songId,
  }) : super(key: key);

  final FavoritesController favoritesController = Get.find();
  final int songId;

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      label: 'to favorite'.tr,
      backgroundColor: screensColors['songBook']!.withOpacity(0.5),
      icon: Icons.favorite_border,
      onPressed: (context) => favoritesController.addToFavorites(songId),
    );
  }
}
