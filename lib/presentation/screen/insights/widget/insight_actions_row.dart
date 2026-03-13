import 'package:flutter/material.dart';

class InsightActionsRow extends StatelessWidget {
  const InsightActionsRow({
    super.key,
    required this.isLiked,
    required this.isBusy,
    required this.onLike,
    required this.onComment,
    required this.onShare,
    this.showCommentButton = true,
  });

  final bool isLiked;
  final bool isBusy;
  final VoidCallback? onLike;
  final VoidCallback? onComment;
  final VoidCallback? onShare;
  final bool showCommentButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: isBusy ? null : onLike,
          icon: Icon(
            isLiked ? Icons.favorite : Icons.favorite_border,
            color: isLiked ? Colors.redAccent : null,
          ),
        ),
        if (showCommentButton)
          IconButton(
            onPressed: onComment,
            icon: const Icon(Icons.mode_comment_outlined),
          ),
        IconButton(
          onPressed: onShare,
          icon: const Icon(Icons.send_outlined),
        ),
      ],
    );
  }
}
