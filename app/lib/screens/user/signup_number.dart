import 'package:app/api/user_service.dart';
import 'package:app/components/common/CustomSnackBar.dart';
import 'package:app/components/common/custom_button.dart';
import 'package:app/components/user/signup_step.dart';
import 'package:app/components/user/signup_timer.dart';
import 'package:app/components/user/user_textform_field.dart';
import 'package:app/constants.dart';
import 'package:app/models/user/signup_user.dart';
import 'package:app/screens/user/signup_id.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupNumber extends StatefulWidget {
  const SignupNumber({Key? key}) : super(key: key);

  @override
  State<SignupNumber> createState() => _SignupNumberState();
}

bool flag = true;
String number = '';
String code = '';
SignupUserModel user = Get.arguments;

class _SignupNumberState extends State<SignupNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(child: SizedBox()),
          Flexible(flex: 12, child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    SignupStep(step: 1),
                    Container(
                      margin : EdgeInsets.only(bottom: 60),
                      child: Text('번호를 입력해주세요.', style: TextStyle(
                          fontSize: titleTextSize,
                          fontWeight: FontWeight.w700
                      ),),
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: UserTextFormField(hint: '번호', obscureText: false,
                        onChanged: (val){
                          number = val;
                        },),
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: Text('-(하이픈) 없이 입력해주세요',
                          style: TextStyle(
                              color: Color(0xff797979)
                          ),
                        )
                    ),
                    flag ?
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      width: double.infinity,
                      height: 70,
                      child: ElevatedButton(
                          onPressed: (){
                            setState(() {
                              flag = false;
                              user.phone = number;
                            });
                            UserService.sendAuthPhone(user.phone, user.role);
                            CustomSnackBar.alertSnackbar(context, '인증번호를 전송했습니다.');
                            },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: darkNavy,
                            foregroundColor: Colors.white,
                            minimumSize: Size(50, double.infinity)
                          ),
                          child: Text('인증번호 받기')
                      ),
                    )
                        :
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 6),
                                width: double.infinity,
                                child: SignupTimer()
                              ),
                              UserTextFormField(
                                  hint: '인증번호',
                                  onChanged: (val){
                                    setState(() {
                                      code = val;
                                    });
                                  },
                                  obscureText: false
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                width: double.infinity,
                                height: 70,
                                child: ElevatedButton(
                                    onPressed: (){
                                      setState(() {
                                        user.phone = number;
                                      });
                                      UserService.sendAuthPhone(user.phone, user.role);
                                      },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: darkNavy,
                                        foregroundColor: Colors.white,
                                        minimumSize: Size(50, double.infinity)
                                    ),
                                    child: Text('인증번호 다시 전송하기')
                                ),
                              )
                            ],
                          ),
                        )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: CustomButton(text: '다음', height: 70,
                  onPressed: (){
                    phoneCheck();
                  }),
              ),
            ],
          )),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  void phoneCheck() async {
    if(flag) {
      CustomSnackBar.errorSnackbar(context, '인증을 진행해주세요');
      return;
    }else if(code == '') {
      CustomSnackBar.errorSnackbar(context, '인증번호를 입력해주세요.');
      return;
    }
    final res = await UserService.authPhoneCheck(user.phone, code);
    if(res) {
      CustomSnackBar.alertSnackbar(context, '인증되었습니다.');
      Get.to(SignupId(), arguments: user);
    }else {
      CustomSnackBar.errorSnackbar(context, '인증에 실패하였습니다.');
      setState(() {
        number = '';
        flag = true;
      });
    }
  }
}
