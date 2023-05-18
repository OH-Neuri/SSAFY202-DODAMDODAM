
import 'package:app/api/attendance_service.dart';
import 'package:app/components/common/paint_page.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class SignButtonCustom extends StatelessWidget {
  final String forthTime;
  final String backTime;
  final String backWay;
  final String parentName;
  final String phoneNumber;
  final String tempParentName;
  final String tempPhoneNumber;

  const SignButtonCustom({
    required this.forthTime,
    required this.backTime,
    required this.backWay,
    required this.parentName,
    required this.phoneNumber,
    required this.tempParentName,
    required this.tempPhoneNumber,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 5, 32),
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Center(child: Text("서명하기",style:TextStyle(
                  fontSize:18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600
                ) )),
                actions: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 270,
                        height: 180,
                        child: PaintPage(),
                        decoration: BoxDecoration(
                          border: Border.all(style: BorderStyle.solid, color: Colors.black26),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 20, 14, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 3.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                backgroundColor: Colors.grey[200],
                              ),
                              child: Text(
                                "돌아가기",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 3.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                backgroundColor:cardBtnPink,
                              ),
                              child: Text(
                                "보내기",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              onPressed: () {
                                AttendanceService.registAttendance(
                                  forthTime,backTime,backWay,parentName,phoneNumber,tempParentName,tempPhoneNumber
                                );
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: darkPink,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          minimumSize: Size(100, 30)
        ),
        child: Text(
          "서명하기",
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
      ),
    );
  }
}
