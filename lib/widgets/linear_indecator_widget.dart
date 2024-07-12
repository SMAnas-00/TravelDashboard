import 'package:flutter/material.dart';

class LinearIndecatorWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  const LinearIndecatorWidget({super.key,this.height,this.width,this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: height,
      width: width,
      child: LinearProgressIndicator(backgroundColor: Colors.transparent,color: color,),
    );
  }
}