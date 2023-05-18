import 'package:app/components/common/title_appBar.dart';
import 'package:app/components/medicine/medicine_parent_card.dart';
import 'package:app/constants.dart';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/controller/medicine_controller.dart';
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
    DeviceInfoController dc = Get.put(DeviceInfoController());
    MedicineController mc = Get.put(MedicineController());
    return GetBuilder<MedicineController>(builder:
    (_)=>
      Scaffold(
        appBar: TitleAppBar(title: "투약 의뢰서"),
      body: Stack(
          children: [
            Positioned(
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
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
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: AttendaneListTimePicker(
                                      onDateSelected: (date) {
                                        setState(() {
                                          _selectedDate = date;
                                          mc.setMedicineKidMonthList(_selectedDate);
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              for(int i=mc.medicineKidMonth.length-1; i>=0; i--)
                                Padding(
                                  padding:const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    child:MedicineParentCard( object:mc.medicineKidMonth[i]),
                                ),
                            ListView(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              children: <Widget>[
                                Container(height: 50), // 예시로 높이 200인 빈 컨테이너 추가
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
            ),
            Positioned(
                bottom: 40,
                right: 40,
                child: ElevatedButton(
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) =>
                      MedicineParentRegistPage()));},
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(70, 70),
                      backgroundColor: darkYellow,
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
      )
    );
  }
}

