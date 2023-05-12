import 'package:flutter/material.dart';
import 'package:app/constants.dart';

class OneLineFood extends StatelessWidget {
  final dynamic menu;
  const OneLineFood({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: menu != null ?
          Text(menu, style: TextStyle(fontSize: contentTextSize)) :
          SizedBox()
    );
  }
}
