
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/controller/medicine_controller.dart';
import 'package:app/models/medicine/medicine_kid_month_list_model.dart';
import 'package:app/screens/medicine/medicine_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:app/constants.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class MedicineParentCard extends StatelessWidget {
  const MedicineParentCard({
    super.key,
    required this.object,
  });

  final MedicineKidMonth object;

  @override
  Widget build(BuildContext context) {
    DeviceInfoController dc = Get.put(DeviceInfoController());
    MedicineController mc = Get.put(MedicineController());

    return GetBuilder<MedicineController>(builder: (_)=>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 30, 0),
          child: Text(DateFormat('dd일').format(object.requestDate) ,style:TextStyle(
              fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black87
          )),
        ),
        ElevatedButton(onPressed: () async {
                  final res = await mc.setMedicineKidDetail(object.medicineSeq);
                  if(res) {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) =>
                        MedicineDetailPage(kidName: dc.kidName,
                            kidClassName: dc.className,
                            kidPhoto: dc.kidPhoto)));
                  }
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                backgroundColor: object.responseDate == null ? cardGray:lightPink,
                foregroundColor: textColor,
                minimumSize: Size(50,20),
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0)
            ),
            child:SizedBox(
              height: 70,
              width: 200,
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Center(child: Text("투약 여부",style: TextStyle(fontSize: 14),)),
                        ),
                        Expanded(
                          child: Center(child: Text("완료 시간",style: TextStyle(fontSize: 14),)),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Center(
                            child: Visibility(
                              visible: object.responseDate==null,
                              replacement: Icon(Icons.check_circle_outline_rounded,size: 30, color:cardBtnPink),
                              child: Icon(Icons.check_circle_outline_rounded,size: 30, color:cardBtnGray),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(object.responseDate != null ? DateFormat('hh:mm:ss').format(DateTime.parse(object.responseDate)) : "",
                                  style: TextStyle(
                                  fontSize: 14
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
        )
      ],
    )
    );
  }
}