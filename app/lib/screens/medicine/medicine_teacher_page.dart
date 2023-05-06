import 'package:app/components/attendance/attendance_card.dart';
import 'package:app/components/attendance/attendance_list_timepicker.dart';
import 'package:app/components/medicine/medicine_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedicineTeacherPage extends StatefulWidget {

  const MedicineTeacherPage({Key? key}) : super(key: key);
  _MedicineTeacherPageState createState() => _MedicineTeacherPageState();

}
class _MedicineTeacherPageState extends State<MedicineTeacherPage> {

  late DateTime _selectedDate = DateTime.now();
  String? _selectedChild;

  final List<String> _children = [    '오하늘',    '김나현',    '이연희',  ];

  @override
  Widget build(BuildContext context) {
    const title = 'Grid List';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text(title),
        ),
        body: Row(
          children: [
            Expanded(child: SizedBox()),
            Flexible(
              flex: 12,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 15,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Text("투약 의뢰서", style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),)
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Flexible(
                          flex: 9,
                          child: Padding(
                            padding: EdgeInsets.all(0),
                            child: AttendaneListTimePicker(
                              onDateSelected: (date) {
                                setState(() {
                                  _selectedDate = date;
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
                        padding: EdgeInsets.fromLTRB(10,10,0,3),
                        child: Text(
                          '2023년 8월 13일',
                          style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w300,
                          ),

                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(8, 13, 8, 13),
                        child: GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 23.0,
                          crossAxisSpacing: 21.0,
                          children: List.generate(30, (index) {
                            return Center(
                                child: GestureDetector(
                                  onTap:(){
                                    Get.toNamed('/medicine/teacher/detail');
                                  },
                                  child: MedicineCard(),
                                ));
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
