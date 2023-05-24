import 'package:app/controller/chatting_controller.dart';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/models/chatting/chatting_teacher_list_model.dart';
import 'package:app/models/chatting/chatting_user_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChattingRoomList extends StatelessWidget {
  const ChattingRoomList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isTeacher = DeviceInfoController.to.isTeacher;
    ChattingController cc = Get.put(ChattingController());

    return GetBuilder<ChattingController>(builder: (_) =>
        ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              // 쓸 객체 선언
              SingleUser singleUser = SingleUser(kidName: "", kidPhoto: "");
              SingleTeacher singleTeacher = SingleTeacher(classTeacherSeq: -1, teacherName: "");
              if (isTeacher) {
                // 채팅방 리스트로 바꾸기
                singleUser = ChattingController.to.userList[index];
              }
              else {
                // 채팅방 리스트로 바꾸기
                singleTeacher = ChattingController.to.teacherList[index];
              }

              // 화면단
              return Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 왼쪽
                    Row(


                    ),
                    // 오른쪽 - lastContent 시간
                    SizedBox(

                    )
                  ],
                ),
              );
            }
        )
    );
  }
}
