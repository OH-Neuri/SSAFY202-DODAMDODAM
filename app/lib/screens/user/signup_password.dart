import 'package:app/api/user_service.dart';
import 'package:app/components/common/CustomSnackBar.dart';
import 'package:app/components/common/custom_button.dart';
import 'package:app/components/user/signup_step.dart';
import 'package:app/components/user/user_textform_field.dart';
import 'package:app/constants.dart';
import 'package:app/models/user/signup_user.dart';
import 'package:app/screens/user/Signup_welcome.dart';
import 'package:app/screens/user/signup_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPassword extends StatefulWidget {
  const SignupPassword({Key? key}) : super(key: key);

  @override
  State<SignupPassword> createState() => _SignupPasswordState();
}

SignupUserModel user = Get.arguments;
String pwCheck = '';
bool able1 = false;
bool able2 = false;
Text text = Text('최소 6자 이상', style: TextStyle(color: Color(0xff797979)),);
Text textCheck = Text('');

class _SignupPasswordState extends State<SignupPassword> {
  Text getPwValid() {
    if(user.password.length < 6){
      setState(() {
        able1 = false;
      });
      return Text('최소 6자 이상 입력해주세요.', style: TextStyle(color: Colors.red),);
    }
    setState(() {
      able1 = true;
    });
    return Text('', style: TextStyle(color: Color(0xff797979)),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(child: SizedBox()),
          Flexible(flex: 12, child: Column(
            children: [
              Expanded(child: Column(
                children: [
                  SignupStep(step: 3),
                  Container(
                    margin : EdgeInsets.only(bottom: 60),
                    child: Text('비밀번호를 입력해주세요.', style: TextStyle(
                        fontSize: titleTextSize,
                        fontWeight: FontWeight.w700
                    ),),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: UserTextFormField(
                      hint: '비밀번호',
                      obscureText: true,
                      onChanged: (val){
                        setState(() {
                          user.password = val;
                          getPwValid();
                        });
                      },),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: text,
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: UserTextFormField(
                      hint: '비밀번호 확인',
                      obscureText: true,
                      onChanged: (val){
                        pwCheck = val;
                      },
                    ),
                  ),
                  pwCheck != '' ?
                  SizedBox(
                    width: double.infinity,
                    child: pwCheck == user.password ?
                    Text(''):
                    Text('비밀번호가 일치하지 않습니다.', style: TextStyle(color: Colors.red)),
                  )
                  : Text(''),
                ],
              )),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: CustomButton(
                  text: '가입하기',
                  height: 70,
                  onPressed: (){
                    pwAndPwCheck();
                  },),
              ),
            ],
          )),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  void pwAndPwCheck() async {
    if (!able1 || user.password != pwCheck) {
      CustomSnackBar.errorSnackbar(context, '비밀번호를 다시 확인해주세요.');
      return;
    }
    final res = await UserService.userSignup(user);
    print(res);
    if(res) {
      Get.to(SignupWelcome());
    }else{
      CustomSnackBar.errorSnackbar(context, '회원가입에 실패했습니다.');
      Get.to(SignupSelect());
    }

  }
}
