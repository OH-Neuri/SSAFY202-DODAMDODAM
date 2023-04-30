import 'package:app/modules/attendance/attendance_list_name_select.dart';
import 'package:flutter/material.dart';

import 'package:app/modules/attendance/attendance_list_timepicker.dart';


class AttendanceList extends StatefulWidget {
  const AttendanceList({Key? key}) : super(key: key);
  @override
  _AttendanceListState createState() => _AttendanceListState();
}

class _AttendanceListState extends State<AttendanceList> {
  late DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(),
          body: Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Column(
                children:[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: AttendanceListNameSelect(),
                      ),
                      Expanded(
                        child: AttendaneListTimePicker(
                          onDateSelected: (date) {
                            setState(() {
                              _selectedDate = date;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                     color: Colors.red
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("2022년 8월 13일")
                      ],
                    ),
                  ),
                  Container(

                  )
                ]

            ),
          ),
        ));
  }
}
