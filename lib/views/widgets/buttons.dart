import 'package:flutter/material.dart';
class CustomTextButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color backgroundColor;
  final Color textColor;

  const CustomTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
      ),
      child: SizedBox(
        width: 250,
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: textColor),
          ),
        ),
      ),
    );
  }
}
