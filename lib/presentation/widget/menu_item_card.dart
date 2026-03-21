import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/core/routes/app_routes.dart';
import 'package:icoc/presentation/bloc/bible_study_bloc/bible_study_bloc.dart';
import 'package:icoc/presentation/bloc/insights/insights_bloc.dart';
import 'package:icoc/presentation/bloc/insights/insights_state.dart';
import 'package:icoc/presentation/bloc/songs_bloc/songs_bloc.dart';
import 'package:icoc/presentation/screen/home/widget/menu_items.dart';

class MenuItemCard extends StatelessWidget {
  MenuItemCard(this.item, {super.key});
  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: MediaQuery.of(context).size.width * 0.9,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            _MenuItemIcon(item: item),
            const SizedBox(
              width: 7,
            ),
            Expanded(
              child: AutoSizeText(
                item.title.tr(context: context),
                maxLines: 3,
                style: TextStyle(
                  fontSize: 35,
                  color: item.color,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    const BoxShadow(
                      color: Colors.white,
                      offset: Offset(-2, 1),
                      blurRadius: 1.5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuItemIcon extends StatelessWidget {
  const _MenuItemIcon({required this.item});

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    final Widget icon = Icon(
      item.icon,
      size: 55,
      color: item.color,
      shadows: [
        const BoxShadow(
          color: Colors.white,
          offset: Offset(-2.5, 2.5),
          blurRadius: 2,
          spreadRadius: 2,
        ),
      ],
    );

    if (item.routeName == SONGBOOK) {
      return BlocSelector<SongsBloc, SongsState, int>(
        selector: (SongsState state) => state.maybeWhen(
          success: (songs, unreadCount, newSongIds) => unreadCount,
          orElse: () => 0,
        ),
        builder: (BuildContext context, int unreadCount) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              icon,
              if (unreadCount > 0)
                Positioned(
                  top: -6,
                  right: -10,
                  child: _UnreadBadge(count: unreadCount),
                ),
            ],
          );
        },
      );
    }

    if (item.routeName == BIBLE_STUDY) {
      return BlocSelector<BibleStudyBloc, BibleStudyState, int>(
        selector: (BibleStudyState state) => state.maybeWhen(
          success: (topics, unreadCount, newTopicIds, newLessonIds) =>
              unreadCount,
          orElse: () => 0,
        ),
        builder: (BuildContext context, int unreadCount) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              icon,
              if (unreadCount > 0)
                Positioned(
                  top: -6,
                  right: -10,
                  child: _UnreadBadge(count: unreadCount),
                ),
            ],
          );
        },
      );
    }

    if (item.routeName != INSIGHTS) {
      return icon;
    }

    return BlocSelector<InsightsBloc, InsightsState, int>(
      selector: (InsightsState state) => state.maybeWhen(
        loaded: (
          List<dynamic> _,
          List<String> __,
          Map<String, bool> ___,
          Set<String> ____,
          Set<String> _____,
          int unreadCount,
          String? ______,
        ) =>
            unreadCount,
        orElse: () => 0,
      ),
      builder: (BuildContext context, int unreadCount) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            icon,
            if (unreadCount > 0)
              Positioned(
                top: -6,
                right: -10,
                child: _UnreadBadge(count: unreadCount),
              ),
          ],
        );
      },
    );
  }
}

class _UnreadBadge extends StatelessWidget {
  const _UnreadBadge({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    final String label = count > 9 ? '9+' : count.toString();
    return Container(
      constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ) ??
              const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w800,
              ),
        ),
      ),
    );
  }
}
