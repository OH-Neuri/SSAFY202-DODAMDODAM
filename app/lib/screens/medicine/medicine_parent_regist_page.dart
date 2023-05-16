import 'package:app/components/common/text_form_field_custom.dart';
import 'package:app/components/medicine/medicine_sign_button.dart';
import 'package:app/components/medicine/medicine_text_form.dart';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/controller/medicine_controller.dart';
import 'package:flutter/material.dart';
import 'package:app/constants.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class MedicineParentRegistPage extends StatefulWidget {

  const MedicineParentRegistPage({Key? key}) : super(key: key);
  _MedicineParentRegistPageState createState() => _MedicineParentRegistPageState();
}

class _MedicineParentRegistPageState extends State<MedicineParentRegistPage> {
  @override
  Widget build(BuildContext context) {
    DeviceInfoController dc = Get.put(DeviceInfoController());
    MedicineController ac = Get.put(MedicineController());
    return GetBuilder<MedicineController>(builder:
    (_)=>
      Scaffold(
      appBar: AppBar(),
      body: Row(
        children: [
          Expanded(child: SizedBox()),
          Flexible(
              flex:12,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("투약 의뢰서 내용",style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700
                        ),)
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsetsDirectional.symmetric(vertical: 15),
                          padding: EdgeInsets.fromLTRB(10, 0, 25, 0),
                          width: 180,
                          height: 52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            color: cardYellow,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.circle,size: 43, color:Colors.white),
                              Text("용용반",style: TextStyle(
                                fontSize: 16,
                              ),),
                              Text("이연희",style: TextStyle(
                                fontSize: 16,
                              ),)
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(    // 보란색 박스
                      width: 500,
                      height: 330,
                      margin: EdgeInsets.only(bottom: 15),
                      padding: EdgeInsets.symmetric(vertical: 10 ,horizontal: 30),
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
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),),
                                Expanded(child:
                                  MedicineTextForm(hint:"ex) 열나요")
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              children: [
                                Text("종류 : ", style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),),
                                Expanded(child:
                                MedicineTextForm(hint:"ex) 알약")
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              children: [
                                Text("용량 : ", style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),),
                                Expanded(child:
                                MedicineTextForm(hint:"ex) 개별 한 봉지 모두")
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              children: [
                                Text("횟수 : ", style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),),
                                Expanded(child:
                                MedicineTextForm(hint:"ex) 1회")
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              children: [
                                Text("시간 : ", style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),),
                                Expanded(child:
                                MedicineTextForm(hint:"ex) 식후 30분")
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              children: [
                                Text("보관 : ", style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),),
                                Expanded(child:
                                MedicineTextForm(hint:"ex) 실온 보관")
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text("비고 : ", style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),),
                              Expanded(
                                  child: MedicineTextForm(hint:"ex) 연희는 딸기사탕 없으면 약 안먹어요")
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Text("투약으로 인한 책임은 의뢰자가 집니다.", style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("2023.04.19",style: TextStyle(
                              fontSize: 22
                          ),),
                          Text("김숙자",style: TextStyle(
                              fontSize: 22
                          ),),
                          MedicineSignButton(),
                        ],
                      ),
                    ),

                    Divider(thickness: 1,height: 1,color: Colors.black26,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 5, 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("투약 보고서 내용",style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700
                          ),),
                        ],
                      ),
                    ),
                    Text("금일 본 유치원/어린이집의 '이연희' 아동에 대해 의뢰하신", style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54
                    )),
                    Text("내용대로 투약 하였음을 보고합니다.", style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54
                    )),
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
