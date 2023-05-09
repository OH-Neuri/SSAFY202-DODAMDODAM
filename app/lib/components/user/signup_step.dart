import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class SignupStep extends StatelessWidget {
  final int step;

  const SignupStep({required this.step});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          for(int i =0; i<4; i++)
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                height: 8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: step == i ? darkYellow :Color(0xffD5D5D5)
                ),
              ),
            )
        ],
      ),
    );
  }
}