import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MenuItemCard extends StatelessWidget {
  MenuItemCard(
    this.title,
    this.color,
    this.icon,
    this.routeName,
  );
  final String title;
  final Color color;
  final IconData icon;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: MediaQuery.of(context).size.width * 0.9,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 50,
              color: color,
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
              child: AutoSizeText(
                title.tr(context: context),
                maxLines: 3,
                style: TextStyle(
                  fontSize: 32,
                  color: color,
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
      ),
    );
  }
}
