import 'package:app/components/common/custom_button.dart';
import 'package:app/components/user/signup_step.dart';
import 'package:app/components/user/user_textform_field.dart';
import 'package:app/constants.dart';
import 'package:app/models/user/signup_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPassword extends StatefulWidget {
  const SignupPassword({Key? key}) : super(key: key);

  @override
  State<SignupPassword> createState() => _SignupPasswordState();
}

SignupUserModel user = Get.arguments;
String pwCheck = '';
Text text = Text('');

class _SignupPasswordState extends State<SignupPassword> {
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
                      obscureText: false,
                      onChanged: (val){
                        setState(() {
                          user.password = val;
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
                      obscureText: false,
                      onChanged: (val){
                        pwCheck = val;
                      },
                    ),
                  ),
                ],
              )),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: CustomButton(
                  text: '가입하기',
                  height: 70,
                  onPressed: (){ },),
              ),
            ],
          )),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
