import 'package:app/models/attendance/attendance_list_model.dart';
import 'package:app/screens/attendance/attendance_list.dart';
import 'package:flutter/material.dart';
import 'package:app/constants.dart';

class AttendanceCard extends StatelessWidget {


  final AttendanceListItem kid;
  const AttendanceCard({
    super.key,
    required this.kid
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(  //모서리를 둥글게 하기 위해 사용
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 4.0, //그림자 깊이
      color: kid.forthTimeCheck!=null&& kid.backTimeCheck!=null? cardYellow: cardGray,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 15, 12, 0),
        child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 40, height: 40,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(kid.photo),
                    ),
                  ),
                 Container(
                      width: 50, height: 40,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text(kid.name, style: TextStyle(fontSize: 13)),
                     ],
                   ),
                 )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(3, 10, 3, 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("등원 시간 :", style: TextStyle(fontSize: 11),),
                        Text(kid.forthTimeCheck??"",style: TextStyle(fontSize: 11)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                            Text("하원 시간:",style: TextStyle(fontSize: 11)),
                            Text(kid.backTimeCheck??"", style: TextStyle(fontSize: 11)),
                          ]
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        width: 53,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: kid.forthTimeCheck!=null&& kid.backTimeCheck!=null? cardBtnYellow:cardBtnGray,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(kid.forthTimeCheck!=null&& kid.backTimeCheck!=null?"확인완료":"미확인", style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                            )
                          ],
                        )
                    )],
                ),
              ),
            ]),
      ),
    );
  }
}
