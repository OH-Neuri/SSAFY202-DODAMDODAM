import 'package:app/components/common/title_appBar.dart';
import 'package:app/components/setting/setting_add_button.dart';
import 'package:app/components/user/input_class_code_dialog.dart';
import 'package:app/components/user/input_kid_code_dialog.dart';
import 'package:app/constants.dart';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/controller/setting_controller.dart';
import 'package:app/models/code/add_class_model.dart';
import 'package:app/models/code/add_kid_model.dart';
import 'package:app/root.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeSetting extends StatelessWidget {
  const ChangeSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceInfoController dc = Get.put(DeviceInfoController());
    SettingController sc = Get.put(SettingController());
    return GetBuilder<SettingController>(builder: (_)=>
      Scaffold(
        appBar: TitleAppBar(title: dc.isTeacher ? '반 추가/변경하기' : '아이 추가/변경하기'),
        body: Row(
          children: [
            Expanded(child: SizedBox()),
            Flexible(flex: 12,
              child: Container(
                padding: EdgeInsets.only(top: 30),
                width: double.infinity,
                child:
                dc.isTeacher
                // 선생님일 경우
                ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text('${dc.name}님의 반 목록 입니다.', style: TextStyle(
                          fontSize: contentTextSize
                      ),),
                    ),
                    for(AddClass ac in sc.classList)
                      InkWell(
                        onTap: (){
                          dc.classSetting(ac);
                          Get.offAll(Root());
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 14),
                                    child: CircleAvatar(backgroundImage: AssetImage('assets/images/common/flower_icon.png'),),
                                  ),
                                  Text(ac.className, style: TextStyle(
                                      color: textColor,
                                      fontSize: contentTextSize,
                                      fontWeight: FontWeight.w500
                                  ),),
                                ],
                              ),
                              ac.classSeq == dc.classSeq ?
                              Icon(Icons.check) :
                              Text('')
                            ],
                          ),
                        ),
                      ),

                    // 아이 추가 버튼
                    SettingAddButton(text: '반', widget: InputClassCodeDialog(),),
                  ],
                )
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text('${dc.name}님의 아이 목록 입니다.', style: TextStyle(
                        fontSize: contentTextSize
                      ),),
                    ),
                    for(AddKid kid in sc.kidList)
                      InkWell(
                        onTap: (){
                          dc.kidSetting(kid);
                          Get.offAll(Root());
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 14),
                                    child: CircleAvatar(backgroundImage: NetworkImage(kid.kidPhoto),),
                                  ),
                                  Text(kid.kidName, style: TextStyle(
                                    color: textColor,
                                    fontSize: contentTextSize,
                                    fontWeight: FontWeight.w600
                                  ),),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Text('(${kid.className})', style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: subContentTextSize
                                    ),),
                                  )
                                ],
                              ),
                              kid.kidSeq == dc.kidSeq ?
                              Icon(Icons.check) :
                              Text('')
                            ],
                          ),
                        ),
                      ),

                    // 아이 추가 버튼
                    SettingAddButton(text: '아이', widget: InputKidCodeDialog(),),
                  ],
                ),
              )
            ),
            Expanded(child: SizedBox()),
          ],
        ),
      )
    );
  }
}


