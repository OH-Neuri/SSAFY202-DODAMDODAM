import 'package:app/components/common/input_form.dart';
import 'package:app/components/user/user_textform_field.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:app/components/attendance/attendance_list_timepicker.dart';

class AttendanceListDetail extends StatefulWidget {
  const AttendanceListDetail({Key? key}) : super(key: key);

  @override
  _AttendanceListDetailState createState() => _AttendanceListDetailState();
}

class _AttendanceListDetailState extends State<AttendanceListDetail> {
  final TextEditingController _attendanceTimeController =
  TextEditingController();
  final TextEditingController _leaveTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const title = 'Grid List';
    return MaterialApp(
      title: title,
      home: Scaffold(
        resizeToAvoidBottomInset:false,
        appBar: AppBar(
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
                      width: 425,
                      height: 60,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.circle_notifications_sharp,
                                  size: 60,
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "이연희",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text("꽃님반")
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "2023년 8월 13일",
                                  style: TextStyle(fontSize: 18),
                                )
                              ],
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InputForm(hint:"등원 예정 시간",enabled: true),
                          Expanded(child: SizedBox()),
                          InputForm(hint:"귀가 예정 시간",enabled: true),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InputForm(hint:"등원 시간",enabled: false ),
                          Expanded(child: SizedBox()),
                          InputForm(hint:"귀가 시간",enabled: false),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
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
                              UserTextFormField(hint: '귀가 방법 입력', onChanged: (val){}, obscureText: false)
                            ],
                          ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InputForm(hint:"보호자1",enabled: true),
                          Expanded(child: SizedBox()),
                          InputForm(hint:"보호자1 연락처",enabled: true),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InputForm(hint:"보호자2",enabled: true),
                          Expanded(child: SizedBox()),
                          InputForm(hint:"보호자2 연락처",enabled: true),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Column(
                  children: [
                    Text("위 보호자 이외의 다른 사람에게 인계할 때는 사전에 반드시 연락을 취하겠습니다.",
                      style: TextStyle(fontSize: 12.5),),
                    Text("원에서는 부모가 희망하더라도 영유아를 혼자 귀가시키지 않습니다.",
                        style:TextStyle(fontSize: 14)),
                    Text(" 금일 자녀의 귀가를 선생님께 의뢰합니다.",
                      style:TextStyle(fontSize: 20 ) ,)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 90, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("2022년 8월 13일 김부모",  style: TextStyle(fontSize: 20)),
                    Text("(인)")
                  ],
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

