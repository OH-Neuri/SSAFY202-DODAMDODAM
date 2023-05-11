import 'package:flutter/material.dart';

// 채팅방 한 줄
class OneLineChattingRoom extends StatelessWidget {
  const OneLineChattingRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          height: 100,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.deepOrange),
          child: Column(
            children: [

            ],
          ),
        )
    );
  }
}
