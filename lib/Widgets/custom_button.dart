import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButtom extends StatelessWidget {
  CustomButtom({
    required this.onPressed,
    required this.buttonColor,
    required this.buttonText,
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;
  VoidCallback onPressed;
  Color buttonColor;
  String buttonText;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(buttonText),
      style: ElevatedButton.styleFrom(
          fixedSize: Size(MediaQuery.of(context).size.width, 40),
          backgroundColor: buttonColor),
    );
  }
}
