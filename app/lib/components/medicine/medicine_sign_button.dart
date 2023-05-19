
import 'package:app/api/medicine_service.dart';
import 'package:app/components/common/paint_page.dart';
import 'package:app/constants.dart';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/controller/medicine_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MedicineSignButton extends StatelessWidget {

  const MedicineSignButton({
    required this.symptom,
    required this.pill,
    required this.capacity,
    required this.count,
    required this.time,
    required this.keep,
    required this.content,
    super.key,
  });

  final String symptom;
  final  pill;
  final  capacity;
  final  count;
  final  time;
  final  keep;
  final  content;

  @override
  Widget build(BuildContext context) {
    DeviceInfoController dc = Get.put(DeviceInfoController());
    MedicineController mc = Get.put(MedicineController());
    return GetBuilder<MedicineController>(builder:
    (_)=>

        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          height: 26,
          width: 80,
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Center(child: Text("서명하기",style:TextStyle(
                        fontSize:18,
                        color: Colors.black87,
                        fontWeight: FontWeight.w700
                    ) )),
                    actions: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("금일 본 유치원/어린이집의 아동에 대해 ", style: TextStyle(
                              fontSize: 12),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("의뢰 및 투약하였음을 보고합니다." , style: TextStyle(fontSize: 12),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 270,
                            height: 180,
                            margin: EdgeInsets.only(top: 15),
                            decoration: BoxDecoration(
                              border: Border.all(style: BorderStyle.solid, color: Colors.black26),
                            ),
                            child: PaintPage(),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 80,
                              height: 26,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  backgroundColor: cardGray,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Text(
                                    "돌아가기",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                            SizedBox(
                              width: 80,
                              height: 26,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                                  //
                                  if(!dc.isTeacher) {
                                    MedicineService.updateMedicineInfo(symptom, pill, capacity, count, time, keep, content, dc.name, DateFormat('yyyy-MM-dd').format(DateTime.now()));
                                  } else {
                                    MedicineService.updateMedicineTime(mc.medicineKidDetail.medicineSeq, DateFormat('yyyy-MM-dd hh:mm').format(DateTime.now()));
                                  }
                                  Navigator.of(context).pop();
                                },
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
                backgroundColor: cardBtnPink,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            child: Text("서명하기", style: TextStyle(fontSize: 13)),
          ),
        )
    );
  }
}
