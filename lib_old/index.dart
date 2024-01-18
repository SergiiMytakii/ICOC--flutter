import 'package:logger/logger.dart';

//packages
export 'package:get/get.dart';
export 'package:get_storage/get_storage.dart';
export 'package:flutter/material.dart';
export 'package:get/get_utils/src/extensions/internacionalization.dart';
export 'package:flutter/services.dart';
export 'package:share_plus/share_plus.dart';
export 'package:path/path.dart';
export 'package:oktoast/oktoast.dart';
export 'app/theme.dart';
export 'package:wakelock/wakelock.dart';
export 'package:qr_flutter/qr_flutter.dart';
export 'package:html/parser.dart';

export 'package:miniplayer/miniplayer.dart';
// export 'package:youtube_player_iframe/youtube_player_iframe.dart';

//controllers

export 'song_book/logic/controllers/songs_controller.dart';
export 'app/settings/logic/General_settings_controller.dart';
export 'app/logic/controllers/main_screen_controller.dart';
export 'song_book/logic/controllers/order_lang_controller.dart';
export 'song_book/logic/controllers/playlists_controller.dart';
export 'song_book/logic/controllers/favorites_controller.dart';
export 'song_book/logic/controllers/slides_controller.dart';
export 'song_book/logic/controllers/song_screen_controller.dart';
export 'song_book/logic/controllers/song_lang_controller.dart';
export 'bible_study/logic/bible_study_controller.dart';
export 'news/logic/controllers/icoc_ru_news_controller.dart';
export 'q_and_a/logic/q_and_a_controller.dart';
export 'song_book/logic/controllers/video_player_controller.dart';

//servises
export 'song_book/logic/services/db_sqlite/sqlite_helper_fts4.dart';
export 'song_book/logic/services/database_firebase_service.dart';
export 'song_book/logic/services/data_search.dart';
export 'package:cloud_firestore/cloud_firestore.dart';
export 'song_book/logic/services/import_songs.dart';
export 'song_book/logic/services/data_search_from_playlist.dart';
export 'package:url_launcher/url_launcher.dart';
export 'q_and_a/logic/sqlite_database_service.dart';
export 'news/logic/services/insta_public_api/models/basic_model.dart';
export 'app/logic/services/youtube_service.dart';
//debug
export 'package:logger/logger.dart';

//routes
export 'app/routes/routes.dart';
export 'app/routes/pages.dart';

//screens and widgets
export 'app/modules/youtube_playlist_player/screens/youtube_playlist_player.dart';
export 'app/screens/share_app_screen.dart';
export 'news/screens/kyiv_insta_news_screen.dart';
export 'news/screens/main_news_screen.dart';
export 'app/modules/youtube_playlist_player/screens/widgets/video_card_teaching.dart';
export 'song_book/screens/playlists/add_song_to_playlist.dart';
export 'app/screens/widgets/snackbar.dart';
export 'app/screens/widgets/custom_button.dart';
export 'song_book/screens/songs/widgets/slide_actions.dart';
export 'song_book/screens/songs/widgets/checkbox_list_tile.dart';
export 'song_book/screens/widgets/font_size_adjust_bottom_sheet.dart';
export 'app/screens/widgets/modal_bottom_sheet.dart';
export 'app/logic/utilites/youtube_player.dart';
export 'app/screens/main_screen.dart';
export 'app/settings/general_settings_screen.dart';
export 'bible_study/screens/bible_study_screen.dart';
export 'news/screens/icoc_news_ru_screen.dart';
export 'q_and_a/screens/q_and_a_screen.dart';
export 'song_book/screens/playlists/playlist_screen.dart';
export 'song_book/screens/songs/slides_screen.dart';
export 'song_book/screens/songs/song_screen.dart';
export 'song_book/screens/widgets/bottom_navigation_bar.dart';
export 'app/menu/my_drawer.dart';
export 'song_book/screens/playlists/add_song_from_playlist.dart';
export 'song_book/screens/videoplayer/widgets/video_card.dart';
export 'song_book/screens/widgets/android_app_bar_song_book_screen.dart';
export 'song_book/screens/widgets/ios_app_bar_song_book_screen.dart';
export 'song_book/screens/songs/widgets/song_list.dart';
export 'song_book/screens/songs/widgets/song_text_on_song_screen.dart';
export 'song_book/screens/songs/widgets/bottom_sheet_filter.dart';
export 'song_book/screens/favorites/favorites_screen.dart';
export 'song_book/screens/playlists/playlists_list_screen.dart';
export 'song_book/screens/songs/song_book_screen.dart';
export 'app/screens/widgets/loading.dart';
export 'song_book/screens/songs/widgets/song_card.dart';
export 'app/screens/about_app_screen.dart';
export 'news/screens/icoc_ru_one_news_screen.dart';
export 'bible_study/screens/one_lesson_screen.dart';
export 'bible_study/screens/one_topic_screen.dart';

//constants
export 'app/constants.dart';

//theme
export 'package:adaptive_theme/adaptive_theme.dart';

//localizations
export 'package:get/get_utils/src/extensions/internacionalization.dart';
export 'app/localization/messages.dart';

//models
export 'song_book/models/song.dart';
export 'q_and_a/models/q_and_a_model.dart';
export 'song_book/models/song_detail.dart';
export 'song_book/models/resources.dart';

final log = Logger();
