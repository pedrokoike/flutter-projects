import 'package:flutter/material.dart';
import '../constants.dart';

class BottonButton extends StatelessWidget {
  const BottonButton(this.buttonTitle, this.onTap);

  final String buttonTitle;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text(
          buttonTitle,
          style: kLargeButtonTextStyle,
        )),
        color: kBottonContainerColor,
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
