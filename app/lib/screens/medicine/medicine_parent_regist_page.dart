import 'package:app/components/common/text_form_field_custom.dart';
import 'package:app/components/medicine/medicine_sign_button.dart';
import 'package:app/components/medicine/medicine_text_form.dart';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/controller/medicine_controller.dart';
import 'package:flutter/material.dart';
import 'package:app/constants.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MedicineParentRegistPage extends StatefulWidget {



  const MedicineParentRegistPage({
    Key? key,

  }) : super(key: key);
  _MedicineParentRegistPageState createState() => _MedicineParentRegistPageState();
}

class _MedicineParentRegistPageState extends State<MedicineParentRegistPage> {

  String symptom ='';
  String pill= '';
  String capacity= '';
  String count= '';
  String time= '';
  String keep= '';
  String content= '';
  String requestDate= '';
  String requestName= '';
  String responseDate= '';
  String responseName= '';

  void _updateSymptom(String newText){
    setState(() {
      symptom = newText;
    });
  }

  void _updatePill(String newText){
    setState(() {
      pill = newText;
    });
  }

  void _updateCapacity(String newText){
    setState(() {
      capacity = newText;
    });
  }

  void _updateCount(String newText){
    setState(() {
      count = newText;
    });
  }

  void _updateTime(String newText){
    setState(() {
      time = newText;
    });
  }

  void _updateKeep(String newText){
    setState(() {
      keep = newText;
    });
  }

  void _updateContent(String newText){
    setState(() {
      content = newText;
    });
  }

  void _updateRequestDate(String newText){
    setState(() {
      requestDate = newText;
    });
  }

  void _updateResponseDate(String newText){
    setState(() {
      responseDate = newText;
    });
  }

  void _updateResponseName(String newText){
    setState(() {
      responseName = newText;
    });
  }




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
                padding: const EdgeInsets.symmetric(vertical: 17),
                child: ListView(
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
                          padding: EdgeInsets.fromLTRB(10, 0, 25, 0),
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
                                  child: CircleAvatar(backgroundImage: NetworkImage(dc.kidPhoto))),
                              Text(dc.className ,style: TextStyle(
                                fontSize: 12,
                              ),textAlign: TextAlign.center,),
                              Padding(
                                padding: const EdgeInsets.only(left: 3),
                                child: Text(dc.kidName,style: TextStyle(
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
                      height: 250,
                      margin: EdgeInsets.only(bottom: 10),
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
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),),
                                Expanded(child:
                                  MedicineTextForm(updateText: _updateSymptom, hint:"ex) 열나요")
                                )
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
                                Expanded(child:
                                MedicineTextForm(updateText:_updatePill , hint:"ex) 알약")
                                )
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
                                Expanded(child:
                                MedicineTextForm(updateText:_updateCapacity, hint:"ex) 개별 한 봉지 모두")
                                )
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
                                Expanded(child:
                                MedicineTextForm(updateText:_updateCount, hint:"ex) 1회")
                                )
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
                                Expanded(child:
                                MedicineTextForm(updateText:_updateTime,hint:"ex) 식후 30분")
                                )
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
                                Expanded(child:
                                MedicineTextForm(updateText: _updateKeep, hint:"ex) 실온 보관")
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text("비고 : ", style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),),
                              Expanded(
                                  child: MedicineTextForm(updateText:_updateContent , hint:"ex) 연희는 딸기사탕 없으면 약 안먹어요")
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Text("투약으로 인한 책임은 의뢰자가 집니다.", style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54
                    ),textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(DateFormat('yyyy.MM.dd').format(DateTime.now()),style: TextStyle(
                              fontSize: 16
                          ),),
                          Text(dc.name,style: TextStyle(
                              fontSize: 16
                          ),),
                          MedicineSignButton(
                            symptom : symptom, pill : pill , capacity : capacity, count: count,
                            time : time, keep : keep, content: content),
                        ],
                      ),
                    ),

                    Divider(thickness: 1,height: 1,color: Colors.black26,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 5, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("투약 보고서 내용",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700
                          ),),
                        ],
                      ),
                    ),
                    Text("금일 본 유치원/어린이집의 '이연희' 아동에 대해 의뢰하신", style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54
                    )),
                    Text("내용대로 투약 하였음을 보고합니다.", style: TextStyle(
                        fontSize: 13,
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
