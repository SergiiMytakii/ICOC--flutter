import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/core/bloc/video_bloc/video_bloc.dart';
import 'package:icoc/core/model/resources.dart';
import 'package:icoc/core/model/video.dart';
import 'package:icoc/presentation/screen/video/widget/video_card.dart';
import 'package:icoc/presentation/widget/error_text_on_screen.dart';
import 'package:icoc/presentation/widget/loading.dart';
import 'package:wakelock/wakelock.dart';

//use with iframe_player
class ListVideosScreen extends StatefulWidget {
  final Video video;

  ListVideosScreen({
    Key? key,
    required this.video,
  }) : super(key: key) {
    Wakelock.enable();
  }

  @override
  State<ListVideosScreen> createState() => _ListVideosState();
}

class _ListVideosState extends State<ListVideosScreen> {
  double minHeight = 60;
  double controlsPanelHeight = 0;

  Resources selectedVideo = Resources.defaultResource();
  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) => context
        .read<VideoBloc>()
        .add(GetVideosFromPlaylist(widget.video.playlistId)));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.video.id),
          automaticallyImplyLeading: true,
        ),
        body: Stack(children: [
          BlocBuilder<VideoBloc, VideoState>(
            builder: (context, state) {
              if (state is GetVideosFromPlaylistSuccessState) {
                return ListView.builder(
                  itemBuilder: (context, index) => VideoCard(
                    resources: state.resources[index],
                  ),
                  itemCount: state.resources.length,
                );
              } else if (state is VideoLoadingState) {
                return Loading();
              } else if (state is VideoErrorState) {
                return ErrorTextOnScreen(message: state.message);
              } else {
                return Container();
              }
            },
          ),
        ]),
      ),
    );
  }
}
