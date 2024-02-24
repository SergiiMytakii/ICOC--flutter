import 'package:flutter/material.dart';
import 'package:icoc/presentation/widget/loading.dart';

class CustomRefreshIndicator extends StatefulWidget {
  final Function onRefresh;
  const CustomRefreshIndicator({required this.onRefresh, this.child});
  final Widget? child;

  @override
  State<CustomRefreshIndicator> createState() => _CustomRefreshIndicatorState();
}

class _CustomRefreshIndicatorState extends State<CustomRefreshIndicator> {
  double opacity = 1;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragDown: (details) {
        if (mounted) {
          setState(() {
            opacity = 0;
            print('drag');
          });
        }
      },
      child: Container(
        height: 700,
        child: RefreshIndicator.adaptive(
          child: ListView(
            children: [
              Opacity(opacity: opacity, child: Loading()),
              widget.child ?? Container(),
            ],
          ),
          onRefresh: () async {
            print('onRefresh');
            Future.delayed(Duration(milliseconds: 500)).then((value) {
              if (mounted) {
                setState(() {
                  opacity = 1;
                });
              }
            });
            return await widget.onRefresh();
          },
        ),
      ),
    );
  }
}
