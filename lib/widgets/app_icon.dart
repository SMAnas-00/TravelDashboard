import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final double? height;
  final double? width;
  const AppIcon({super.key,this.height,this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Image.asset('assets/icons/piechart-2.png'),
    );
  }
}