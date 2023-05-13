import 'package:app/constants.dart';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/screens/chatting/chatting_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChattingTeacherList extends StatelessWidget {
  const ChattingTeacherList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceInfoController dc = Get.put(DeviceInfoController());
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          //  OneSchedule oneschedule = tc.scheduleList[index]; -> 하나씩 이렇게 쓴다
          return Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 0.5)
                  )
              ),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 내용
                  SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        // 사진
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: CircleAvatar(
                              backgroundImage: AssetImage('assets/images/flower_icon.png')
                          ),
                        ),
                        Text('${dc.className} 소정 선생님', style: TextStyle(fontSize: buttonTextSize)),
                      ],
                    ),
                  ),
                  // 채팅 아이콘
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ChattingDetail()));
                        },
                        child: Opacity(
                            opacity: 0.5,
                            child: Image.asset('assets/images/common/chatting_icon.png', height: 35)
                        )
                    ),
                  )
                ],
              )
          );
        }
    );
  }
}
