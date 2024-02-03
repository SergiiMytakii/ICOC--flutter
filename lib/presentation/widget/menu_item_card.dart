import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:icoc/presentation/screen/home/widget/menu_items.dart';

class MenuItemCard extends StatelessWidget {
  MenuItemCard(this.item);
  final MenuItem item;

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
              child: AutoSizeText(
                item.title.tr(context: context),
                maxLines: 3,
                style: TextStyle(
                  fontSize: 32,
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
      ),
    );
  }
}
