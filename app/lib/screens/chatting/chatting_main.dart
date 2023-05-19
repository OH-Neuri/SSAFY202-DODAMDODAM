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
    return GetBuilder<ChattingController>(
        builder: (_) => Scaffold(
            appBar: TitleAppBar(title: "채팅방"),
            body: Column(
              children: [
                // 사용자, 채팅방 중 선택
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 사용자
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        cc.setIsChattingList(false);
                      },
                      overlayColor: MaterialStateProperty.all(Colors.white),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20, 14, 6, 0),
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: cc.isChattingList ? lightPink : cardBtnPink,
                        ),
                        child: Center(
                          child: Text("사용자",
                              style: TextStyle(
                                  color: cc.isChattingList
                                      ? Colors.grey
                                      : Colors.black,
                                  fontSize: contentTextSize)),
                        ),
                      ),
                    )),
                    // 채팅방
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        cc.setIsChattingList(true);
                      },
                      overlayColor: MaterialStateProperty.all(Colors.white),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(6, 14, 20, 0),
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: cc.isChattingList ? cardBtnPink : lightPink,
                        ),
                        child: Center(
                          child: Text("채팅방",
                              style: TextStyle(
                                  color: cc.isChattingList
                                      ? Colors.black
                                      : Colors.grey,
                                  fontSize: contentTextSize)),
                        ),
                      ),
                    )),
                  ],
                ),
                cc.isChattingList
                    ? ChattingRoomList()
                    : // 채팅 '방' 리스트로 바꾸기
                    ChattingUserList()
              ],
            )));
  }
}

// InkWell(
// onTap: (){
// Navigator.push(context, MaterialPageRoute(builder: (context) => ChattingDetail()));
// },
// child: Text('디테일로!'),