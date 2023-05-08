import 'package:app/components/medicine/medicine_parent_card.dart';
import 'package:app/constants.dart';
import 'package:app/screens/medicine/medicine_parent_regist_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/components/attendance/attendance_list_timepicker.dart';
class MedicineParentPage extends StatefulWidget {

  const MedicineParentPage({Key? key}) : super(key: key);
  _MedicineParentPageState createState() => _MedicineParentPageState();
}

class _MedicineParentPageState extends State<MedicineParentPage> {

  late DateTime _selectedDate = DateTime.now();
  String? _selectedChild;
  
  @override
  Widget build(BuildContext context) {
    const title = 'Grid List';
    return Scaffold(
        appBar: AppBar(automaticallyImplyLeading: true, title: const Text(title),),
      body: Stack(
          children: [
            Positioned(
              child: SingleChildScrollView(

                child: Row(
                  children: [
                    Expanded(child: SizedBox(
                      child: VerticalDivider(thickness: 1,width: 1,color: Colors.grey),
                    )),
                    Flexible(flex: 12,
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
                            for(int i=0; i<3; i++)
                              Padding(
                                padding:const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child:MedicineParentCard(i: i),
                              ),
                          ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: <Widget>[
                              Container(height: 450), // 예시로 높이 200인 빈 컨테이너 추가
                              // ListView 내부에 표시되는 다른 위젯들
                            ],
                          )
                          ],
                        )
                    ),
                    Expanded(child: SizedBox()),
                  ],
                ),
              ),
            ),
            Spacer(),
            Positioned(
                bottom: 40,
                right: 40,
                child: ElevatedButton(
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MedicineParentRegistPage()));},
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(80, 80),
                      backgroundColor: logoNavy,
                      foregroundColor: Colors.white,
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)
                      )
                  ),
                  child: Icon(Icons.create),
                )
            )
          ]
      ),
    );
  }
}

