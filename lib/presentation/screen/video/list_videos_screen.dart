import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/video_bloc/video_bloc.dart';
import 'package:icoc/core/model/youtube_video/youtube_video.dart';
import 'package:icoc/presentation/screen/video/widget/video_card.dart';
import 'package:icoc/presentation/widget/animation_wrapper.dart';
import 'package:icoc/presentation/widget/custom_refresh_indicator.dart';
import 'package:icoc/presentation/widget/error_text_on_screen.dart';

class ListVideosScreen extends StatefulWidget {
  final String playlistId;
  final String? playlistName;

  ListVideosScreen({super.key, required this.playlistId, this.playlistName});

  @override
  State<ListVideosScreen> createState() => _ListVideosState();
}

class _ListVideosState extends State<ListVideosScreen> {
  double minHeight = 60;
  double controlsPanelHeight = 0;

  YoutubeVideo selectedVideo = YoutubeVideo.defaultResource();
  @override
  void initState() {
    FirebaseAnalytics.instance.logScreenView(screenName: 'Videos Screen');
    _getVideosList();
    super.initState();
  }

  Future<void> _getVideosList() async {
    getIt<VideoBloc>()
        .add(VideoEvent.getVideosFromPlaylist(playlistId: widget.playlistId));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.playlistName ?? ''),
        ),
        body: BlocBuilder<VideoBloc, VideoState>(
          builder: (context, state) {
            return state.maybeWhen(
              getVideosFromPlaylistSuccess: (youtubeVideos) {
                return RefreshIndicator.adaptive(
                  onRefresh: () => _getVideosList(),
                  child: ListView.builder(
                    cacheExtent: 0,
                    itemBuilder: (context, index) => youtubeVideos.isNotEmpty
                        ? AnimationWrapper(
                            child: VideoCard(
                              youtubeVideos: youtubeVideos[index],
                            ),
                          )
                        : Container(height: 200),
                    itemCount: youtubeVideos.length,
                  ),
                );
              },
              loading: () {
                return CustomRefreshIndicator(
                    onRefresh: () => _getVideosList());
              },
              error: (message) {
                return ErrorTextOnScreen(message: message);
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}
