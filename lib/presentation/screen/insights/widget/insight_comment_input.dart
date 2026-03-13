import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class InsightCommentInput extends StatefulWidget {
  const InsightCommentInput({
    super.key,
    required this.isSubmitting,
    required this.onSubmit,
  });

  final bool isSubmitting;
  final Future<void> Function(String text) onSubmit;

  @override
  State<InsightCommentInput> createState() => _InsightCommentInputState();
}

class _InsightCommentInputState extends State<InsightCommentInput> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          border: Border(
            top: BorderSide(color: theme.dividerColor.withValues(alpha: 0.2)),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                minLines: 1,
                maxLines: 4,
                textInputAction: TextInputAction.newline,
                decoration: InputDecoration(
                  hintText: 'comments_input_hint'.tr(),
                  border: const OutlineInputBorder(),
                  isDense: true,
                ),
              ),
            ),
            const SizedBox(width: 8),
            IconButton.filled(
              onPressed: widget.isSubmitting
                  ? null
                  : () async {
                      final String text = _controller.text.trim();
                      if (text.isEmpty) {
                        return;
                      }
                      await widget.onSubmit(text);
                      if (mounted) {
                        _controller.clear();
                      }
                    },
              icon: widget.isSubmitting
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.send_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
