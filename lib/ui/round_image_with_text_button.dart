import 'package:flutter/material.dart';
import 'round_image_button.dart';

class RoundImageWithTextButton extends StatelessWidget {
  String text = "";

  RoundImageWithTextButton(String text, RoundImageButton roundImageButton) {
    this.text = text;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}
