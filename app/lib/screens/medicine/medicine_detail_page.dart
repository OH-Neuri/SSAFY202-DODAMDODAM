import 'package:app/components/common/title_appBar.dart';
import 'package:app/components/medicine/medicine_sign_button.dart';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/controller/medicine_controller.dart';
import 'package:flutter/material.dart';
import 'package:app/constants.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class MedicineDetailPage extends StatefulWidget {
  final String kidName;
  final String kidClassName;
  final String kidPhoto;
  const MedicineDetailPage({
    Key? key,
    required this.kidName,
    required this.kidClassName,
    required this.kidPhoto
  }) : super(key: key);

  _MedicineDetailPageState createState() => _MedicineDetailPageState();
}

class _MedicineDetailPageState extends State<MedicineDetailPage> {
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
                  flex:12,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 17),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("투약 의뢰서 내용",style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700
                            ),)
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsetsDirectional.symmetric(vertical: 10),
                              padding: EdgeInsets.fromLTRB(10, 0, 15, 0),
                              width: 150,
                              height: 37,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: cardYellow,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                      width: 32,
                                      height: 32,
                                      child: CircleAvatar(backgroundImage: NetworkImage(widget.kidPhoto))),
                                  Text(widget.kidClassName ,style: TextStyle(
                                    fontSize: 12,
                                  ),textAlign: TextAlign.center,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 3),
                                    child: Text(widget.kidName,style: TextStyle(
                                      fontSize: 12,
                                    ),),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(    // 보란색 박스
                          width: 500,
                          height: 235,
                          margin: EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.symmetric(vertical: 20 ,horizontal: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: lightNavy,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  children: [
                                    Text("증상 : ", style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),),
                                    Text(mc.medicineKidDetail.symptom, style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  children: [
                                    Text("종류 : ", style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),),
                                    Text(mc.medicineKidDetail.pill, style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  children: [
                                    Text("용량 : ", style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),),
                                    Text(mc.medicineKidDetail.capacity, style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  children: [
                                    Text("횟수 : ", style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),),
                                    Text(mc.medicineKidDetail.count, style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  children: [
                                    Text("시간 : ", style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),),
                                    Text(mc.medicineKidDetail.time, style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  children: [
                                    Text("보관 : ", style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),),
                                    Text(mc.medicineKidDetail.keep, style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),)
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Text("비고 : ", style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),),
                                  Text(mc.medicineKidDetail.content, style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),)
                                ],
                              ),
                            ],
                          ),
                        ),
                        Text("투약으로 인한 책임은 의뢰자가 집니다.", style: TextStyle(
                            fontSize: 12,
                            color: Colors.black54
                        )),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(mc.medicineKidDetail.requestDate,style: TextStyle(
                                  fontSize: 16
                              ),),
                              Text(mc.medicineKidDetail.requestName,style: TextStyle(
                                  fontSize: 16
                              ),),
                              Icon(Icons.check_circle_outline_rounded,size: 30, color:cardBtnPink)
                            ],
                          ),
                        ),
                        Divider(thickness: 1,height: 1,color: cardBtnGray,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 5, 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("투약 보고서 내용",style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700
                              ),),
                              if(mc.medicineKidDetail.responseName == null && dc.isTeacher)
                                MedicineSignButton(symptom: "",keep: "", capacity: "",content: "",
                                    count: "", pill: "", time: ""),
                            ],
                          ),
                        ),
                        Text("금일 본 유치원/어린이집의 아동에 대해 의뢰하신", style: TextStyle(
                            fontSize: 12,
                            color: Colors.black54
                        )),
                        Text("내용대로 투약 하였음을 보고합니다.", style: TextStyle(
                            fontSize: 13,
                            color: Colors.black54
                        )),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(mc.medicineKidDetail.responseDate ?? "",style: TextStyle(
                                  fontSize: 16
                              ),),
                              Text(mc.medicineKidDetail.responseName ?? "",style: TextStyle(
                                  fontSize: 16
                              ),),
                              if(mc.medicineKidDetail.responseName != null)
                                Icon(Icons.check_circle_outline_rounded,size: 30, color:cardBtnPink)
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
              Expanded(child: SizedBox())
            ],
          ),
        )
    );
  }
}
