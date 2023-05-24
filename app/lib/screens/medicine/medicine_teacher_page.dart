import 'package:app/components/attendance/attendance_card.dart';
import 'package:app/components/attendance/attendance_list_timepicker.dart';
import 'package:app/components/common/title_appBar.dart';
import 'package:app/components/medicine/medicine_card.dart';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/controller/medicine_controller.dart';
import 'package:app/screens/medicine/medicine_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedicineTeacherPage extends StatefulWidget {

  const MedicineTeacherPage({Key? key}) : super(key: key);
  _MedicineTeacherPageState createState() => _MedicineTeacherPageState();

}
class _MedicineTeacherPageState extends State<MedicineTeacherPage> {

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
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AttendaneListTimePicker(
                            onDateSelected: (date) {
                              setState(() {
                                _selectedDate = date;
                                mc.setMedicineKidMonthList(_selectedDate);
                              });
                            },
                          ),
                        ],
                      ),
                      // Set the text alignment to left for 'Attendance List'
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 13),
                          child: GridView.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 15.0,
                            crossAxisSpacing: 15.0,
                            children: List.generate(mc.medicineClassList.length, (index) {
                              return Center(
                                  child: GestureDetector(
                                    onTap:(){
                                      mc.setMedicineKidDetail(mc.medicineClassList[index].medicineSeq);
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => MedicineDetailPage(
                                        kidClassName: DeviceInfoController.to.className, kidName: mc.medicineClassList[index].name, kidPhoto: mc.medicineClassList[index].photo,
                                      )));
                                    },
                                    child: MedicineCard(data: mc.medicineClassList[index]),
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
        )
    );
  }
}
