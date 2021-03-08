import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Center(
        child: SpinKitWanderingCubes(
          color: Theme.of(context).accentColor,
          size: 50.0,
        ),
      ),
    );
  }
}