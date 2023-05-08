import 'package:app/components/common/logout_app_bar.dart';
import 'package:app/components/common/title_appBar.dart';
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
      appBar: TitleAppBar(title: "채팅 메인페이지"),
      body: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ChattingDetail()));
        },
        child: Text('디테일로!'),
      ),
    );
  }
}
