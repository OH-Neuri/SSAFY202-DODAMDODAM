import 'package:app/components/attendance/attendance_list_timepicker.dart';
import 'package:app/components/common/input_form.dart';
import 'package:app/components/common/sign_button_custom.dart';
import 'package:app/components/common/text_form_field_custom.dart';
import 'package:app/components/common/title_appBar.dart';
import 'package:app/controller/attendance_controller.dart';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AttendanceDetailParent extends StatefulWidget {
  const AttendanceDetailParent({Key? key,

  }) : super(key: key);

  @override
  _AttendanceDetailParentState createState() => _AttendanceDetailParentState();
}

class _AttendanceDetailParentState extends State<AttendanceDetailParent> {
  late DateTime _selectedDate = DateTime.now();
  final TextEditingController _attendanceTimeController =
  TextEditingController();
  final TextEditingController _leaveTimeController = TextEditingController();

  DateTime _selectedDay = DateTime.now();

  String forthTime = '';
  String backTime = '';
  String forthTimeCheck = '';
  String backTimeCheck = '';
  String backWay = '';
  String parentName ='';
  String phoneNumber ='';
  String tempParentName = '';
  String tempPhoneNumber = '';

  void _updateForthTime(String newText){
    setState(() {
      forthTime = newText;
    });
  }

  void _updateBackTime(String newText){
    setState(() {
      backTime = newText;
    });
  }

  void _useless(String newText){
    setState(() {
    });
  }

  void _updateBackWay(String newText){
    setState(() {
      backWay = newText;
    });
  }

  void _updateParentName(String newText){
    setState(() {
      parentName = newText;
    });
  }

  void _updatePhoneNumber(String newText){
    setState(() {
      phoneNumber = newText;
    });
  }

  void _updateTempParentName(String newText){
    setState(() {
      tempParentName = newText;
    });
  }

  void _updateTempPhoneNumber(String newText){
    setState(() {
      tempPhoneNumber = newText;
    });
  }

  // @override
  // void initState(){
  //   forthTime = AttendacneController.to.attendacneDetail.forthTime ?? "";
  //   backTime = AttendacneController.to.attendacneDetail.backTime ?? "";
  //   // forthTimeCheck = AttendacneController.to.attendacneDetail.forthTimeCheck ?? "선생님 입력";
  //   // backTimeCheck = AttendacneController.to.attendacneDetail.backTimeCheck ?? "선생님 입력";
  //   backWay = AttendacneController.to.attendacneDetail.backWay ?? "";
  //   parentName = AttendacneController.to.attendacneDetail.parentName ?? "";
  //   phoneNumber = AttendacneController.to.attendacneDetail.phoneNumber ?? "";
  //   tempParentName = AttendacneController.to.attendacneDetail.tempParentName ?? "";
  //   tempPhoneNumber = AttendacneController.to.attendacneDetail.tempPhoneNumber ?? "";
  //   super.initState();
  //
  // }




  @override
  Widget build(BuildContext context) {
    DeviceInfoController dc = Get.put(DeviceInfoController());
    AttendacneController ac = Get.put(AttendacneController());
    return GetBuilder<AttendacneController>(builder: (_)=>
        Scaffold(
        resizeToAvoidBottomInset:true,
        appBar: TitleAppBar(title: '등하원 확인서',),
        body: Row(children: [
          Expanded(child: SizedBox()),
          Flexible(
            flex: 12,
            child: ListView(children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 14),
                child: Row(
                    children: [
                      Flexible(
                        flex:13,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 43,
                                    height: 43,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      backgroundImage: NetworkImage(ac.attendacneDetail.photo),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      ac.attendacneDetail.name,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      AttendaneListTimePicker(
                          onDateSelected: (date) {
                            setState(() {
                              // 해당 날짜 등하원 정보 가져오기
                              _selectedDate = date;
                              ac.setAttendacneDetail(dc.kidSeq,DateFormat('yyyy-MM-dd').format(_selectedDate));
                              print(DateFormat('yyyy-MM-dd').format(_selectedDate));
                            });
                          },
                      ),
                    ]),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InputForm(updateText:_updateForthTime , hint:"등원 예정 시간",content: ac.attendacneDetail.forthTime ?? "ex) 08:00:00", enabled: true,isTeacher:false ),
                        Expanded(child: SizedBox()),
                        InputForm(updateText: _updateBackTime, hint:"귀가 예정 시간",content: (ac.attendacneDetail.backTime ?? "backTime"), enabled: true,isTeacher:false),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InputForm(updateText:_useless, hint:"등원 시간",content:(ac.attendacneDetail.forthTimeCheck ?? "선생님 입력") ,enabled: false ,isTeacher:false),
                        Expanded(child: SizedBox()),
                        InputForm(updateText:_useless,hint:"귀가 시간",content:(ac.attendacneDetail.backTimeCheck ?? "선생님 입력"),enabled: false,isTeacher:false),
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
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                              child: Text("귀가 방법", style: TextStyle(fontSize: 13),),
                            ),
                            TextFormFieldCustom(updateText:_updateBackWay, hint: (ac.attendacneDetail.backWay as String? ?? backWay), onChanged: (val){}, obscureText: false, isTeacher: false,)
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
                        InputForm(updateText:_updateParentName , hint:"보호자1",content:(ac.attendacneDetail.parentName as String? ?? parentName) ,enabled: true,isTeacher:false),
                        Expanded(child: SizedBox()),
                        InputForm(updateText:_updatePhoneNumber, hint:"보호자1 연락처",content:(ac.attendacneDetail.phoneNumber as String? ?? phoneNumber),enabled: true,isTeacher:false),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InputForm(updateText: _updateTempParentName, hint:"보호자2",content:(ac.attendacneDetail.tempParentName as String? ?? tempParentName), enabled: true,isTeacher:false),
                        Expanded(child: SizedBox()),
                        InputForm(updateText: _updateTempPhoneNumber ,hint:"보호자2 연락처",content:(ac.attendacneDetail.tempPhoneNumber as String? ?? tempPhoneNumber) ,enabled: true,isTeacher:false),
                      ],
                    ),
                  )
                ],
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
                      style:TextStyle(fontSize: 18, fontWeight: FontWeight.w500),textAlign: TextAlign.center ,)
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(DateFormat('yyyy년 MM월 dd일').format(_selectedDay)+" "+" "+ dc.name,  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Row(
                      children: [
                        SignButtonCustom(forthTime:forthTime,backTime:backTime,backWay:backWay,
                            parentName:parentName,phoneNumber:phoneNumber,tempParentName:tempParentName,
                            tempPhoneNumber:tempPhoneNumber)
                      ],
                    )
                  ),
                ]
              ),
            ]),
          ),
          Expanded(child: SizedBox()),
        ]),
      ),
    );
  }
}

