import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/constants.dart';
import 'package:icoc/core/bloc/video_bloc/video_bloc.dart';
import 'package:icoc/core/model/video.dart';
import 'package:icoc/presentation/screen/video/list_videos_screen.dart';
import 'package:icoc/presentation/screen/video/widget/bottom_sheet_video_filter.dart';
import 'package:icoc/presentation/widget/error_text_on_screen.dart';
import 'package:icoc/presentation/widget/loading.dart';
import 'package:icoc/presentation/widget/modal_bottom_sheet.dart';

class ListTopicsScreen extends StatefulWidget {
  ListTopicsScreen({Key? key}) : super(key: key);

  @override
  State<ListTopicsScreen> createState() => _ListTopicsScreenState();
}

class _ListTopicsScreenState extends State<ListTopicsScreen> {
  List<Video>? cache;
  @override
  void initState() {
    Future.delayed(Duration.zero)
        .then((value) => context.read<VideoBloc>().add(VideoListRequested()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int i = 0;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Video'.tr(),
          ),
          centerTitle: true,
          actions: [buildFilterButton(context)],
        ),
        body: BlocBuilder<VideoBloc, VideoState>(
          builder: (context, state) {
            if (state is GetVideoListSuccessState) {
              cache = state.topics;
              return _buildBody(state.topics, i);
            } else if (state is VideoLoadingState) {
              return Loading();
            } else if (state is VideoErrorState) {
              return ErrorTextOnScreen(message: state.message);
            } else {
              return cache != null ? _buildBody(cache!, i) : Container();
            }
          },
        ));
  }

  ListView _buildBody(List<Video> topics, int i) {
    return ListView.builder(
      itemCount: topics.length,
      itemBuilder: (context, index) {
        if (i < 4) {
          i++;
        } else {
          i = 0;
        }
        return Column(
          children: [
            ListTile(
              leading: Container(
                width: 40,
              ),
              title: Text(
                topics[index].id,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: Text(
                topics[index].description,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      ListVideosScreen(video: topics[index]))),
            ),
            Divider(
              indent: 50,
              color: dividerColors[i],
              thickness: 1.2,
            ),
          ],
        );
      },
    );
  }

  IconButton buildFilterButton(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.filter_alt_outlined,
      ),
      tooltip: 'icon_button_actions_app_bar_filter'.tr(),
      onPressed: () {
        showModalBottomSheet(
            scrollControlDisabledMaxHeightRatio: 2,
            context: context,
            backgroundColor: Colors.transparent,
            builder: (BuildContext context) {
              return ModalBottomSheet(
                  height: MediaQuery.of(context).size.height / 1.5,
                  blurBackground: false,
                  child: BottomSheetVideoFilter());
            });
      },
    );
  }
}
