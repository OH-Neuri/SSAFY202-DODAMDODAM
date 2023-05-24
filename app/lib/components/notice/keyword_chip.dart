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
      padding: EdgeInsets.fromLTRB(10, 3, 6, 3),
      decoration: BoxDecoration(
          border: Border.all(color: textColor, width: 1),
          borderRadius: BorderRadius.circular(50)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Text(text, style: TextStyle(fontSize: 12),),
          ),
          InkWell(
            onTap: onPressed,
            overlayColor: MaterialStateProperty.all(Colors.white),
            child: Icon(Icons.close, color: Color(0x80ff0000),),
          ),
        ],
      ),
    );
  }
}