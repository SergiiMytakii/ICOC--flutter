import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoContextMenu(
        child: Icon(
          CupertinoIcons.ellipsis,
          color: Colors.white,
        ),
        actions: [
          CupertinoContextMenuAction(
            child: const Text('Option 1'),
            onPressed: () {
              // Handle Option 1
              Navigator.pop(context);
            },
          ),
          CupertinoContextMenuAction(
            child: const Text('Option 2'),
            onPressed: () {
              // Handle Option 2
              Navigator.pop(context);
            },
          ),
          CupertinoContextMenuAction(
            child: const Text('Option 3'),
            onPressed: () {
              // Handle Option 3
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
