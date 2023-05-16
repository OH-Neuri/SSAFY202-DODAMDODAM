import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class KeywordChip extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const KeywordChip({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.fromLTRB(16, 4, 0, 4),
      decoration: BoxDecoration(
          border: Border.all(color: textColor, width: 1),
          borderRadius: BorderRadius.circular(50)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text),
          TextButton(
              onPressed: onPressed,
              style: ButtonStyle(
                shape: MaterialStateProperty.all(CircleBorder(eccentricity: 0)),
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                overlayColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: Icon(Icons.close, color: Colors.redAccent,)
          )
        ],
      ),
    );
  }
}