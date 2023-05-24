import 'package:app/components/common/custom_button.dart';
import 'package:app/components/user/input_class_code_dialog.dart';
import 'package:app/components/user/input_kid_code_dialog.dart';
import 'package:app/constants.dart';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupWelcome extends StatelessWidget {
  DeviceInfoController c = Get.put(DeviceInfoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          Expanded(child: SizedBox()),
          Flexible(flex: 12, child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 200,),
                Container(
                  margin: EdgeInsets.only(bottom: 60),
                  child: Column(
                    children: [
                      Image.asset('assets/images/signup/check.gif', height: 160,),
                      Text('${c.name}님 환영합니다.', style: TextStyle(fontSize: titleTextSize, fontWeight: FontWeight.w600),),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 40.0),
                        child: Text('지금 바로 도담도담과 함께 ${c.isTeacher? '반':'아이'}관리를 시작하세요.', style: TextStyle(fontSize: 14),),
                      ),
                      c.isTeacher ?
                      CustomButton(
                          text: '반 코드 입력하기',
                          height: 60,
                          onPressed: (){
                            showDialog(
                                context: context,
                                barrierDismissible: true, // 바깥 터치 할 시 닫음
                                builder: (BuildContext context) {
                                  return InputClassCodeDialog();
                                }
                            );
                          }) :
                      CustomButton(
                          text: '아이 코드 입력하기',
                          height: 60,
                          onPressed: (){
                            showDialog(
                                context: context,
                                barrierDismissible: true, // 바깥 터치 할 시 닫음
                                builder: (BuildContext context) {
                                  return InputKidCodeDialog();
                                }
                            );
                          }),
                    ],
                  ),
                )
              ],
            ),
          )),
          Expanded(child: SizedBox()),

        ],
      ),
    );
  }
}
