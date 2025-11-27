import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoContextMenu(
        actions: [
          CupertinoContextMenuAction(
            child: const Text('Option 1'),
            onPressed: () {
              // Handle Option 1
              context.pop();
            },
          ),
          CupertinoContextMenuAction(
            child: const Text('Option 2'),
            onPressed: () {
              // Handle Option 2
              context.pop();
            },
          ),
          CupertinoContextMenuAction(
            child: const Text('Option 3'),
            onPressed: () {
              // Handle Option 3
              context.pop();
            },
          ),
        ],
        child: const Icon(
          CupertinoIcons.ellipsis,
          color: Colors.white,
        ),
      ),
    );
  }
}
