import '../../../index.dart';

class AddToPlayList extends StatelessWidget {
  const AddToPlayList({
    Key? key,
    required this.songId,
  }) : super(key: key);

  final int songId;

  @override
  Widget build(BuildContext context) {
    return IconSlideAction(
      caption: 'to playlist'.tr,
      color: screensColors['songBook']!.withOpacity(0.81),
      icon: Icons.playlist_play_outlined,
      onTap: () {
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
    return IconSlideAction(
      caption: 'delete from favorites'.tr,
      color: screensColors['songBook']!.withOpacity(0.7),
      icon: Icons.favorite_border,
      onTap: () => favoritesController.deleteFromFavorites(songId),
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
  final int playlistId;
  final int songId;

  @override
  Widget build(BuildContext context) {
    return IconSlideAction(
        caption: 'remove from playlist'.tr,
        color: screensColors['songBook'],
        icon: Icons.remove_circle_outline_outlined,
        onTap: () =>
            playlistsController.removeFromPlaylist(playlistId, songId));
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
    return IconSlideAction(
      caption: 'to favorite'.tr,
      color: screensColors['songBook']!.withOpacity(0.5),
      icon: Icons.favorite_border,
      onTap: () => favoritesController.addToFavorites(songId),
    );
  }
}
