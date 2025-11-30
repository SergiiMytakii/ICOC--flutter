import 'package:flutter/material.dart';
import 'package:icoc/domain/model/wall/post.dart';
import 'package:icoc/domain/model/wall/post_type.dart';
import 'package:share_plus/share_plus.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 8.0),
            _buildContent(context),
            const SizedBox(height: 8.0),
            _buildActions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(post.author.avatarUrl),
        ),
        const SizedBox(width: 8.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.author.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '${post.createdAt.toLocal()}'.split(' ')[0],
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    if (post.type == PostType.image) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (post.content != null) Text(post.content!),
          if (post.mediaUrl != null) Image.network(post.mediaUrl!),
        ],
      );
    } else if (post.type == PostType.video) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (post.title != null)
            Text(post.title!,
                style: Theme.of(context).textTheme.titleMedium),
          if (post.content != null) Text(post.content!),
          if (post.thumbnailUrl != null) Image.network(post.thumbnailUrl!),
        ],
      );
    } else {
      return Text(post.content ?? '');
    }
  }

  Widget _buildActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.thumb_up_alt_outlined),
              onPressed: () {
                // TODO: Implement like functionality
              },
            ),
            Text('${post.likes}'),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.share),
          onPressed: () {
            _sharePost();
          },
        ),
      ],
    );
  }

  void _sharePost() {
    String shareContent = post.content ?? '';
    if (post.articleUrl != null) {
      shareContent += '\n${post.articleUrl}';
    } else if (post.mediaUrl != null) {
      shareContent += '\n${post.mediaUrl}';
    }
    Share.share(shareContent, subject: post.title);
  }
}
