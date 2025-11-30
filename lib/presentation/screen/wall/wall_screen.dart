import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/user_languages.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/wall/wall_bloc.dart';
import 'package:icoc/presentation/bloc/wall/wall_event.dart';
import 'package:icoc/presentation/bloc/wall/wall_state.dart';
import 'package:icoc/presentation/screen/wall/widget/bottom_sheet_wall_filter.dart';
import 'package:icoc/presentation/screen/wall/widget/post_card.dart';
import 'package:icoc/presentation/widget/animated_filter_button.dart';
import 'package:icoc/presentation/widget/custom_refresh_indicator.dart';
import 'package:icoc/presentation/widget/error_text_on_screen.dart';
import 'package:icoc/presentation/widget/modal_bottom_sheet.dart';
import 'package:icoc/presentation/widget/no_content_warning.dart';

class WallScreen extends StatefulWidget {
  const WallScreen({super.key});

  @override
  State<WallScreen> createState() => _WallScreenState();
}

class _WallScreenState extends State<WallScreen> {
  @override
  void initState() {
    _getPosts();
    super.initState();
  }

  Future<void> _getPosts() async {
    getIt<WallBloc>().add(const WallEvent.fetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wall'),
        centerTitle: true,
        actions: [
          AnimatedFilterIconButton(
            shouldAnimate: StorageKeys.shouldWallFilterAnimate,
            shouldAnimateForever:
                getIt<WallUserLanguagesHandler>().getActiveLanguages().isEmpty,
            onTap: () => showLangFilter(context),
            color: ScreenColors.general,
          )
        ],
      ),
      body: BlocBuilder<WallBloc, WallState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => CustomRefreshIndicator(onRefresh: _getPosts),
            loaded: (posts) {
              if (posts.isEmpty) {
                return const NoContentWarning();
              }
              return CustomRefreshIndicator(
                onRefresh: _getPosts,
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return PostCard(post: posts[index]);
                  },
                ),
              );
            },
            error: (message) => CustomRefreshIndicator(
              onRefresh: _getPosts,
              child: ErrorTextOnScreen(message: message),
            ),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}

Future<dynamic> showLangFilter(BuildContext context) {
  return showModalBottomSheet(
    scrollControlDisabledMaxHeightRatio: 2,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return ModalBottomSheet(
        height: MediaQuery.of(context).size.height / 1.5,
        blurBackground: false,
        child: const BottomSheetWallFilter(),
      );
    },
  );
}
