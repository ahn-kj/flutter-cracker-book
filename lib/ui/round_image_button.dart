import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoundImageButton extends StatelessWidget {
  double width = 100;
  double height = 100;
  String assetPath = "";
  Color color = Colors.white;

  RoundImageButton(double width, double height, String assetPath,
      {Color? color}) {
    this.width = width;
    this.height = height;
    this.assetPath = assetPath;
    if (color != null) this.color = color;
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: this.width,
        height: this.height,
        child: Container(
          decoration: BoxDecoration(
            color: this.color,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: SvgPicture.asset(this.assetPath),
        ));
  }
}
