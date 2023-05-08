import 'package:app/components/attendance/attendance_card.dart';
import 'package:app/constants.dart';
import 'package:app/screens/attendance/attendance_detail_parent.dart';
import 'package:flutter/material.dart';
import 'package:app/components/attendance/attendance_list_timepicker.dart';
import 'package:get/get.dart';

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
              child: Column(
                children: [
                  // Add Row widget to add TimePicker and NameSelector above the GridView
                  Row(
                    children: [
                      Flexible(
                        flex: 12,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: DropdownButtonFormField<String>(
                            dropdownColor: Colors.white,
                            focusColor: Colors.white,
                            value: _selectedChild,
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedChild = newValue;
                              });
                            },
                            items: _children.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                fontSize: 14,
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                              labelText: '전체 원아 보기',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Flexible(
                        flex: 12,
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
                      padding: EdgeInsets.fromLTRB(10,15,0,3),
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
                                onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => AttendanceDetailParent()));},
                                child: AttendanceCard(),
                              ));
                        }),
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






