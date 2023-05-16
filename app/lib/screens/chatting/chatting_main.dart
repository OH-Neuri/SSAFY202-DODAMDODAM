import 'package:app/components/chatting/oneLine_chatting_room.dart';
import 'package:app/components/common/title_appBar.dart';
import 'package:app/components/today/oneline_schedule.dart';
import 'package:app/screens/chatting/chatting_detail.dart';
import 'package:flutter/material.dart';

class ChattingMain extends StatefulWidget {
  const ChattingMain({Key? key}) : super(key: key);

  @override
  State<ChattingMain> createState() => _ChattingMainState();
}

class _ChattingMainState extends State<ChattingMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(title: "채팅방"),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            // OneSchedule oneschedule = tc.scheduleList[index]; -> 하나씩 이렇게 쓴다
            return OneLineChattingRoom();
          }
      )
    );
  }
}

// InkWell(
// onTap: (){
// Navigator.push(context, MaterialPageRoute(builder: (context) => ChattingDetail()));
// },
// child: Text('디테일로!'),