import 'package:flutter/material.dart';
import 'package:icoc/domain/model/insights/insight_comment.dart';

class InsightCommentsSection extends StatelessWidget {
  const InsightCommentsSection({
    super.key,
    required this.comments,
    required this.isLoading,
    required this.onRetry,
  });

  final List<InsightComment> comments;
  final bool isLoading;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    if (isLoading) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Center(child: CircularProgressIndicator.adaptive()),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Comments',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: onRetry,
              child: const Text('Refresh'),
            ),
          ],
        ),
        if (comments.isEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 16),
            child: Text(
              'No comments yet',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          )
        else
          ...comments.map(
            (InsightComment comment) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: theme.textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: '${comment.displayName} ',
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        TextSpan(text: comment.text),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _formatDate(comment.createdAt),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  String _formatDate(DateTime dateTime) {
    final DateTime local = dateTime.toLocal();
    return '${local.year.toString().padLeft(4, '0')}-'
        '${local.month.toString().padLeft(2, '0')}-'
        '${local.day.toString().padLeft(2, '0')}';
  }
}
