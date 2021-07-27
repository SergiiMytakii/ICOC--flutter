import 'package:Projects/shared/constants.dart';
import 'package:Projects/song_book/logic/services/db_sqlite/sqlite_helper_fts4.dart';
import 'package:getxfire/getxfire.dart';

class SlideActionsController extends GetxController {
  SlideActions? slideAction;

  String labelFirstCaption(SlideActions slideAction) {
    switch (slideAction) {
      case SlideActions.Favorites:
        return 'delete from favorites'.tr;
      case SlideActions.AllSongs:
        return 'to favorite'.tr;

      default:
        return 'to favorite'.tr;
    }
  }

  void onTapHandlerFirstCaption(
      SlideActions slideAction, int songId, GetxController? favController) {
    switch (slideAction) {
      case SlideActions.Favorites:
        DatabaseHelperFTS4().deleteFromFavorites(songId);
        favController!.onInit();

        break;

      case SlideActions.AllSongs:
        DatabaseHelperFTS4().addToFavorites(songId);
        update();
        break;
      default:
    }
  }
}
