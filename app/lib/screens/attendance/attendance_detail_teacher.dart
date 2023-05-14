import 'package:app/components/common/input_form.dart';
import 'package:app/components/common/sign_button_custom.dart';
import 'package:app/components/common/text_form_field_custom.dart';
import 'package:app/components/user/user_textform_field.dart';
import 'package:app/constants.dart';
import 'package:app/controller/attendance_controller.dart';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:flutter/material.dart';
import 'package:app/components/attendance/attendance_list_timepicker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AttendanceDetailTeacher extends StatefulWidget {

  const AttendanceDetailTeacher({Key? key, required this.kidSeq, required this.selectedDay}) : super(key: key);
  final int kidSeq;
  final DateTime selectedDay;

  @override
  _AttendanceDetailTeacherState createState() => _AttendanceDetailTeacherState();
}

class _AttendanceDetailTeacherState extends State<AttendanceDetailTeacher> {
  final TextEditingController _attendanceTimeController =
  TextEditingController();
  final TextEditingController _leaveTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DeviceInfoController dc = Get.put(DeviceInfoController());
    AttendacneController ac = Get.put(AttendacneController());
    const title = 'Grid List';
    return GetBuilder<AttendacneController>(builder:
    (_)=>
          Scaffold(
            resizeToAvoidBottomInset:false,
            appBar: AppBar(
              automaticallyImplyLeading: true,
              title: const Text(title),
            ),
            body: Row(children: [
              Expanded(child: SizedBox()),
              Flexible(
                flex: 12,
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Container(
                          width: 325,
                          height: 60,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.circle_notifications_sharp,
                                      size: 55,
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.symmetric(horizontal: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            ac.attendacneDetail.name,
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      DateFormat('yyyy년 MM월 dd일').format(widget.selectedDay),
                                      style: TextStyle(fontSize: 16),
                                    )
                                  ],
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 2, 20, 0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InputForm(hint:"등원 예정 시간",enabled: true,isTeacher:true),
                              Expanded(child: SizedBox()),
                              InputForm(hint:"귀가 예정 시간",enabled: true,isTeacher:true),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InputForm(hint:"등원 시간",enabled: false,isTeacher:true ),
                              Expanded(child: SizedBox()),
                              InputForm(hint:"귀가 시간",enabled: false,isTeacher:true),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                    child: Text("귀가 방법"),
                                  ),
                                  TextFormFieldCustom(hint: '귀가 방법 입력', onChanged: (val){}, obscureText: false, isTeacher:true)
                                ],
                              ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InputForm(hint:"보호자1",enabled: true, isTeacher:true),
                              Expanded(child: SizedBox()),
                              InputForm(hint:"보호자1 연락처",enabled: true,isTeacher:true),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InputForm(hint:"보호자2",enabled: true,isTeacher:true),
                              Expanded(child: SizedBox()),
                              InputForm(hint:"보호자2 연락처",enabled: true,isTeacher:true),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 23),
                    child: Column(

                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("위 보호자 이외의 다른 사람에게 인계할 때는 사전에 반드시 연락을 취하겠습니다.  원 에서는 부모가 희망하더라도 영유아를 혼자 귀가시키지 않습니다.",
                            style: TextStyle(fontSize: 10),textAlign: TextAlign.center,),
                          Text(" 금일 자녀의 귀가를 선생님께 의뢰합니다.",
                            style:TextStyle(fontSize: 16, fontWeight: FontWeight.w500),textAlign: TextAlign.center )

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("2022년 8월 13일 김부모",  style: TextStyle(fontSize: 16)),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                            child: Row(
                              children: [
                                SignButtonCustom(),
                              ],
                            ),
                          ),
                        ]
                    ),
                  ),
                ]),
              ),
              Expanded(child: SizedBox()),
            ]),
          ),
    );
  }
}

