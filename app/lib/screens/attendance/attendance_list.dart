import 'package:app/components/attendance/attendance_card.dart';
import 'package:app/components/common/custom_snackbar.dart';
import 'package:app/constants.dart';
import 'package:app/controller/attendance_controller.dart';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/models/attendance/attendance_list_model.dart';
import 'package:app/screens/attendance/attendance_detail_parent.dart';
import 'package:app/screens/attendance/attendance_detail_teacher.dart';
import 'package:flutter/material.dart';
import 'package:app/components/attendance/attendance_list_timepicker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
class AttendanceList extends StatefulWidget {
  const AttendanceList({Key? key}) : super(key: key);

  @override
  _AttendanceListState createState() => _AttendanceListState();
}

//
  bool is_teacher = Get.arguments.is_teacher;

class _AttendanceListState extends State<AttendanceList> {
  late DateTime _selectedDate = DateTime.now();
  String? _selectedChild;

  // List of children's names to display in dropdown
  // final List<String> _children = [    '오하늘',    '김나현',    '이연희',  ];
  // 아이 리스트

  @override
  Widget build(BuildContext context) {
    DeviceInfoController dc = Get.put(DeviceInfoController());
    AttendacneController ac = Get.put(AttendacneController());
    const title = 'Grid List';
    return GetBuilder<AttendacneController>(builder:
    (_) =>
     Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text(title),
        ),
        body: Row(
          children: [
            Expanded(child: SizedBox()),
            Flexible(
              flex: 12,
              child: Column(
                children: [
                  // Add Row widget to add TimePicker and NameSelector above the GridView
                  Row(
                    children: [
                      Flexible(
                        flex: 15,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 17,30,0),
                          child: SizedBox(
                            width: 130,
                            child: Text(dc.className, style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600
                            ),),
                          )
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Flexible(
                        flex: 11,
                        child: Padding(
                          padding: EdgeInsets.only(top:20),
                          child: AttendaneListTimePicker(
                            onDateSelected: (date) {
                              setState(() {
                                _selectedDate = date;
                                ac.setAttendanceList(_selectedDate);
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Set the text alignment to left for 'Attendance List'
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10,15,0,3),
                      child: Text(
                        DateFormat('yyyy년 MM월 dd일').format(_selectedDate),
                        style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400,
                        ),

                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 13, 20, 13),
                      child: GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15.0,
                        crossAxisSpacing: 15.0,
                        children: [
                          for(AttendanceListItem item in ac.attendaceList)
                               GestureDetector(
                                onTap:() async {
                                  final res = await ac.setAttendacneDetail(item.kidSeq,DateFormat('yyyy-MM-dd').format(_selectedDate));
                                  if (res && ac.attendacneDetail.parentName == null) {
                                    CustomSnackBar.errorSnackbar(context, '입력된 등하원 정보가 없습니다.');
                                  }else{
                                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                    // 선생님, 학부모 구분해서 페이지 이동
                                   AttendanceDetailTeacher(kidSeq:item.kidSeq, selectedDay: _selectedDate,)
                                  ));};

                                  },
                                child:
                                     AttendanceCard(kid:item),
                              )
                          ]
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: SizedBox()),
          ],
        ),
      ),
  );
  }
}






