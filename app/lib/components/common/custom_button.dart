import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double height;
  final dynamic onPressed;
  const CustomButton({required this.text, required this.height, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: darkYellow,
            minimumSize: Size(double.infinity, height),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
        ),
        child: Text(text, style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.w600
        ),)
    );
  }
}