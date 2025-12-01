import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/domain/model/insights/post.dart';
import 'package:icoc/domain/model/insights/post_type.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/insights/insights_bloc.dart';
import 'package:icoc/presentation/bloc/insights/insights_event.dart';
import 'package:icoc/presentation/bloc/insights/insights_state.dart';
import 'package:icoc/presentation/widget/coming_soon_placeholder.dart';
import 'package:icoc/presentation/widget/custom_refresh_indicator.dart';
import 'package:icoc/core/user_languages.dart';
import 'package:share_plus/share_plus.dart';

class OneInsightScreen extends StatefulWidget {
  final Post? post;
  final String? postId;
  final String? lang;

  const OneInsightScreen({super.key, this.post, this.postId, this.lang});

  @override
  State<OneInsightScreen> createState() => _OneInsightScreenState();
}

class _OneInsightScreenState extends State<OneInsightScreen> {
  @override
  void initState() {
    super.initState();
    final handler = getIt<InsightsUserLanguagesHandler>();
    if (widget.lang != null && widget.lang!.isNotEmpty) {
      if (!handler.containsLang(widget.lang!)) {
        handler.addLanguage(widget.lang!, true).then((_) {
          context.read<InsightsBloc>().add(const InsightsEvent.fetch());
        });
      } else if (!handler.getActiveLanguages().contains(widget.lang)) {
        handler.updateLanguage(widget.lang!, true).then((_) {
          context.read<InsightsBloc>().add(const InsightsEvent.fetch());
        });
      }
    } else {
      context.read<InsightsBloc>().add(const InsightsEvent.fetch());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insights'.tr()),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              final p = _resolvePostFromState(context);
              if (p != null) {
                String content = p.content ?? '';
                if (p.articleUrl != null) {
                  content += '\n${p.articleUrl}';
                } else if (p.mediaUrl != null) {
                  content += '\n${p.mediaUrl}';
                }
                SharePlus.instance.share(ShareParams(text: content));
              }
            },
          )
        ],
      ),
      body: BlocBuilder<InsightsBloc, InsightsState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (posts) {
              final post = _resolvePost(posts);
              if (post == null) {
                return CustomRefreshIndicator(
                  onRefresh: () async {
                    context
                        .read<InsightsBloc>()
                        .add(const InsightsEvent.fetch());
                  },
                  child: const ComingSoonPlaceholder(),
                );
              }
              return CustomRefreshIndicator(
                onRefresh: () async {
                  context.read<InsightsBloc>().add(const InsightsEvent.fetch());
                },
                child: _buildPostBody(context, post),
              );
            },
            error: (_) => CustomRefreshIndicator(
              onRefresh: () async {
                context.read<InsightsBloc>().add(const InsightsEvent.fetch());
              },
              child: const ComingSoonPlaceholder(),
            ),
            orElse: () => const ComingSoonPlaceholder(),
          );
        },
      ),
    );
  }

  Post? _resolvePostFromState(BuildContext context) {
    final state = context.read<InsightsBloc>().state;
    return state.maybeWhen(
      loaded: (posts) => _resolvePost(posts),
      orElse: () => widget.post,
    );
  }

  Post? _resolvePost(List<Post> posts) {
    if (widget.post != null) return widget.post;
    if (widget.postId == null || widget.postId!.isEmpty) return null;
    try {
      return posts.firstWhere((p) => p.id == widget.postId);
    } catch (_) {
      return null;
    }
  }

  Widget _buildPostBody(BuildContext context, Post post) {
    final children = <Widget>[];
    if (post.title != null && post.title!.isNotEmpty) {
      children.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            post.title!,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      );
    }
    children.add(
      Row(
        children: [
          CircleAvatar(backgroundImage: NetworkImage(post.author.avatarUrl)),
          const SizedBox(width: 8),
          Text(post.author.name, style: Theme.of(context).textTheme.bodyMedium),
          const Spacer(),
          Text(
            '${post.createdAt.toLocal()}'.split(' ')[0],
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
    children.add(const SizedBox(height: 12));

    if (post.type == PostType.image) {
      if (post.content != null) {
        children.add(Text(post.content!));
        children.add(const SizedBox(height: 8));
      }
      if (post.mediaUrl != null) {
        children.add(Image.network(post.mediaUrl!));
      }
    } else if (post.type == PostType.video) {
      if (post.content != null) {
        children.add(Text(post.content!));
        children.add(const SizedBox(height: 8));
      }
      if (post.thumbnailUrl != null) {
        children.add(Image.network(post.thumbnailUrl!));
      }
    } else {
      children.add(Text(post.content ?? ''));
    }

    children.add(const SizedBox(height: 16));
    children.add(
      Row(
        children: [
          IconButton(
            icon: const Icon(Icons.thumb_up_alt_outlined),
            onPressed: () {},
          ),
          Text('${post.likes}'),
        ],
      ),
    );

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
