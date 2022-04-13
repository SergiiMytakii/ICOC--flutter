import 'package:logger/logger.dart';

//packages
export 'package:getxfire/getxfire.dart';
export 'package:get_storage/get_storage.dart';
export 'package:flutter/material.dart';
export 'package:get/get_utils/src/extensions/internacionalization.dart';
export 'dart:convert';
export 'package:audio_service/audio_service.dart';
export 'package:flutter/services.dart';
export 'package:share_plus/share_plus.dart';
export 'package:path/path.dart';
export 'package:oktoast/oktoast.dart';
export 'package:icoc/app/theme.dart';
export 'package:flutter/services.dart';
export 'package:wakelock/wakelock.dart';
export 'package:qr_flutter/qr_flutter.dart';
export 'package:html/parser.dart';

export 'package:miniplayer/miniplayer.dart';
export 'package:youtube_player_iframe/youtube_player_iframe.dart';

//controllers

export 'package:icoc/news/logic/controllers/kyiv_insta_news_controller.dart';
export 'package:icoc/song_book/logic/controllers/songs_controller.dart';
export 'package:icoc/app/settings/logic/General_settings_controller.dart';
export 'package:icoc/app/logic/controllers/main_screen_controller.dart';
export 'package:icoc/song_book/logic/controllers/order_lang_controller.dart';
export 'package:icoc/song_book/logic/controllers/playlists_controller.dart';
export 'package:icoc/song_book/logic/controllers/favorites_controller.dart';
export 'package:icoc/song_book/logic/controllers/slides_controller.dart';
export 'package:icoc/song_book/logic/controllers/song_screen_controller.dart';
export 'package:icoc/song_book/logic/controllers/song_lang_controller.dart';
export 'package:icoc/bible_study/logic/bible_study_controller.dart';
export 'package:icoc/news/logic/controllers/icoc_ru_news_controller.dart';
export 'package:icoc/q_and_a/logic/q_and_a_controller.dart';
export 'package:icoc/song_book/logic/controllers/video_player_controller.dart';

//servises

export 'package:icoc/app/logic/services/service_locator.dart';
export 'package:icoc/song_book/logic/services/db_sqlite/sqlite_helper_fts4.dart';
export 'package:icoc/song_book/logic/services/database_firebase_service.dart';
export 'package:icoc/song_book/logic/services/data_search.dart';
export 'package:cloud_firestore/cloud_firestore.dart';
export 'package:icoc/song_book/logic/services/import_songs.dart';
export 'package:icoc/song_book/logic/services/data_search_from_playlist.dart';
export 'package:url_launcher/url_launcher.dart';
export 'package:icoc/q_and_a/logic/sqlite_database_service.dart';
export 'package:icoc/app/logic/utilites/ext_video_player.dart';
export 'package:icoc/news/logic/services/insta_public_api/models/basic_model.dart';
export 'package:icoc/app/logic/services/youtube_service.dart';
//debug
export 'package:logger/logger.dart';

//routes
export 'package:icoc/app/routes/routes.dart';
export 'package:icoc/app/routes/pages.dart';

//screens and widgets
export 'package:icoc/app/modules/youtube_playlist_player/screens/youtube_playlist_player.dart';
export 'package:icoc/app/screens/share_app_screen.dart';
export 'package:icoc/news/screens/kyiv_insta_news_screen.dart';
export 'package:icoc/news/screens/main_news_screen.dart';
export 'package:icoc/song_book/screens/videoplayer/ext_player/video_ext_player_screen.dart';
export 'package:icoc/app/modules/youtube_playlist_player/screens/widgets/video_card_teaching.dart';
export 'package:icoc/song_book/screens/playlists/add_song_to_playlist.dart';
export 'package:icoc/app/screens/widgets/snackbar.dart';
export 'package:icoc/app/screens/widgets/custom_button.dart';
export 'package:icoc/song_book/screens/songs/widgets/slide_actions.dart';
export 'package:icoc/song_book/screens/songs/widgets/checkbox_list_tile.dart';
export 'package:icoc/song_book/screens/widgets/font_size_adjust_bottom_sheet.dart';
export 'package:icoc/app/screens/widgets/modal_bottom_sheet.dart';
export 'package:icoc/app/logic/utilites/youtube_player.dart';
export 'package:icoc/app/screens/main_screen.dart';
export 'package:icoc/app/settings/general_settings_screen.dart';
export 'package:icoc/bible_study/screens/bible_study_screen.dart';
export 'package:icoc/news/screens/icoc_news_ru_screen.dart';
export 'package:icoc/q_and_a/screens/q_and_a_screen.dart';
export 'package:icoc/song_book/screens/playlists/playlist_screen.dart';
export 'package:icoc/song_book/screens/songs/slides_screen.dart';
export 'package:icoc/song_book/screens/songs/song_screen.dart';
export 'package:icoc/song_book/screens/widgets/bottom_navigation_bar.dart';
export 'package:icoc/app/menu/my_drawer.dart';
export 'package:icoc/song_book/screens/playlists/add_song_from_playlist.dart';
export 'package:icoc/song_book/screens/videoplayer/widgets/video_card.dart';
export 'package:icoc/song_book/screens/widgets/android_app_bar_song_book_screen.dart';
export 'package:icoc/song_book/screens/widgets/ios_app_bar_song_book_screen.dart';
export 'package:icoc/song_book/screens/songs/widgets/song_list.dart';
export 'package:icoc/song_book/screens/songs/widgets/song_text_on_song_screen.dart';
export 'package:icoc/song_book/screens/songs/widgets/bottom_sheet_filter.dart';
export 'package:icoc/song_book/screens/favorites/favorites_screen.dart';
export 'package:icoc/song_book/screens/playlists/playlists_list_screen.dart';
export 'package:icoc/song_book/screens/songs/song_book_screen.dart';
export 'package:icoc/app/screens/widgets/loading.dart';
export 'package:icoc/song_book/screens/songs/widgets/song_card.dart';
export 'package:icoc/app/screens/about_app_screen.dart';
export 'package:icoc/news/screens/icoc_ru_one_news_screen.dart';
export 'package:icoc/bible_study/screens/one_lesson_screen.dart';
export 'package:icoc/bible_study/screens/one_topic_screen.dart';

//constants
export 'package:icoc/app/constants.dart';

//theme
export 'package:adaptive_theme/adaptive_theme.dart';

//localizations
export 'package:get/get_utils/src/extensions/internacionalization.dart';
export 'package:icoc/app/localization/messages.dart';

//models
export 'package:icoc/song_book/models/song.dart';
export 'package:icoc/q_and_a/models/q_and_a_model.dart';
export 'package:icoc/song_book/models/song_detail.dart';
export 'package:icoc/song_book/models/resources.dart';

final log = Logger();
