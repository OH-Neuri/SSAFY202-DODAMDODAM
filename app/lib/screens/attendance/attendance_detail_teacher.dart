import 'dart:ffi';

import 'package:app/components/common/input_form.dart';
import 'package:app/components/common/sign_button_custom.dart';
import 'package:app/components/common/text_form_field_custom.dart';
import 'package:app/components/user/user_textform_field.dart';
import 'package:app/api/attendance_service.dart';
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
  String _forthTimeCheck = '';
  String _backTimeCheck = '';


  void _useless(String newText){
    setState(() {
    });
  }


  @override
  void initState(){
    super.initState();
    _forthTimeCheck = AttendacneController.to.attendacneDetail.forthTimeCheck ?? '등원 시간 입력';
    _backTimeCheck = AttendacneController.to.attendacneDetail.backTimeCheck ?? '하원 시간 입력';

  }

  @override
  Widget build(BuildContext context) {

    DeviceInfoController dc = Get.put(DeviceInfoController());
    AttendacneController ac = Get.put(AttendacneController());
    const title = 'Grid List';
    // late bool isInvalid = ac.attendacneDetail.parentName!=null?true:false;
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
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: 5),
                                      width: 45,
                                      height: 45,
                                      child:CircleAvatar(
                                        backgroundColor: Colors.white,
                                        backgroundImage: NetworkImage(ac.attendacneDetail.photo),
                                       ),
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
                              InputForm(updateText: _useless,hint:"등원 예정 시간",content:(ac.attendacneDetail.forthTime as String? ?? ""), enabled: false,isTeacher:true),
                              Expanded(child: SizedBox()),
                              InputForm(updateText: _useless, hint:"귀가 예정 시간",content:(ac.attendacneDetail.backTime as String? ?? ""), enabled: false,isTeacher:true),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text("등원 시간",style: TextStyle(
                                      fontSize: 13
                                    ),),
                                  ),
                                  GestureDetector(
                                      onTap: (){
                                        setState(() {
                                         _forthTimeCheck = DateFormat('hh:mm:ss').format(DateTime.now());
                                        });
                                        AttendanceService.updateAttendanceTime(ac.attendacneDetail.attendanceSeq,_forthTimeCheck,_backTimeCheck,widget.kidSeq);
                                        },
                                    child:Container(
                                        width: 140,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: cardYellow,
                                            border:Border.all(
                                                color: cardBtnYellow
                                            )
                                        ),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                                        child:

                                        Text(

                                          _forthTimeCheck, style: TextStyle(
                                          fontSize: 14
                                        ),),
                                      ),
                                    )
                                  )
                                ],
                              ),
                              Expanded(child: SizedBox()),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text("귀가 시간", style: TextStyle(
                                      fontSize: 13
                                    ),),
                                  ),
                                  GestureDetector(
                                      onTap: (){
                                        setState(() {
                                        _backTimeCheck = DateFormat('hh:mm:ss').format(DateTime.now());
                                        });
                                        AttendanceService.updateAttendanceTime(ac.attendacneDetail.attendanceSeq,_forthTimeCheck,_backTimeCheck,widget.kidSeq);
                                        },
                                      child:Container(
                                        width: 140,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: cardYellow,
                                            border:Border.all(
                                                color: cardBtnYellow
                                            )
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                                          child: Text(_backTimeCheck, style: TextStyle(
                                              fontSize: 14
                                          ),),
                                        ),
                                      )
                                  )
                                ],
                              ),
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
                                  TextFormFieldCustom(updateText: _useless, hint: (ac.attendacneDetail.backWay as String? ?? ""), onChanged: (val){}, enabled: false, obscureText: false, isTeacher:true)
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
                              InputForm(updateText: _useless, hint:"보호자1", content:(ac.attendacneDetail.parentName as String? ?? ""),enabled: false, isTeacher:true),
                              Expanded(child: SizedBox()),
                              InputForm(updateText: _useless,hint:"보호자1 연락처",content:(ac.attendacneDetail.phoneNumber as String? ?? ""),enabled: false,isTeacher:true),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InputForm(updateText: _useless, hint:"보호자2",content:(ac.attendacneDetail.tempParentName as String? ?? ""), enabled: false,isTeacher:true),
                              Expanded(child: SizedBox()),
                              InputForm(updateText: _useless,hint:"보호자2 연락처",content:(ac.attendacneDetail.tempParentName as String? ?? ""), enabled: false,isTeacher:true),
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
                    padding: const EdgeInsets.only(top: 50),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (ac.attendacneDetail.parentName is String)
                            Text(DateFormat('yyyy년 MM월 dd일').format(widget.selectedDay) +" "+" "+(ac.attendacneDetail.parentName as String? ?? ""),  style: TextStyle(fontSize: 16)),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Row(
                              children: [
                                if (ac.attendacneDetail.parentName is String)
                                  Icon(Icons.check_circle_outline_rounded,color: cardBtnPink,size: 35,),
                                Text("")
                              ],
                            ),
                          ),
                        ]
                    ),
                  ),
                ]),
              ),
              Expanded(child: SizedBox()),
              Row(
                children: [
                ],
              )
            ]),
          ),
    );
  }
}

