import 'package:flutter/material.dart';

import '../screen/home_screen.dart';

class MenuItemCard extends StatelessWidget {
  MenuItemCard(this.item);
  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            item.icon,
            size: 50,
            color: item.color,
            shadows: [
              BoxShadow(
                color: Colors.white,
                offset: Offset(-2, 1),
                blurRadius: 1.5,
                spreadRadius: 2.0,
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              item.title,
              style: TextStyle(
                fontSize: 36,
                color: item.color,
                fontWeight: FontWeight.bold,
                shadows: [
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-2, 1),
                    blurRadius: 1.5,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
