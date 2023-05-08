import 'package:app/components/common/custom_button.dart';
import 'package:app/components/common/logout_app_bar.dart';
import 'package:app/components/user/signup_timer.dart';
import 'package:app/components/user/user_textform_field.dart';
import 'package:app/constants.dart';
import 'package:app/models/user/signup_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupNumber extends StatefulWidget {
  const SignupNumber({Key? key}) : super(key: key);

  @override
  State<SignupNumber> createState() => _SignupNumberState();
}

SignupUser user = Get.arguments;
bool flag = true;

class _SignupNumberState extends State<SignupNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoutAppBar(),
      body: Row(
        children: [
          Expanded(child: SizedBox()),
          Flexible(flex: 12, child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      margin : EdgeInsets.fromLTRB(0, 60, 0, 50),
                      child: Text('번호를 입력해주세요.', style: TextStyle(
                          fontSize: titleTextSize,
                          fontWeight: FontWeight.w700
                      ),),
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: UserTextFormField(hint: '번호', obscureText: false,
                        onChanged: (val){
                          user.phone_number = val;
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
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      width: double.infinity,
                      height: 70,
                      child: ElevatedButton(
                          onPressed: (){setState(() {
                            flag = false;
                          });},
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
                              UserTextFormField(hint: '인증번호', onChanged: (val){}, obscureText: false),
                            ],
                          ),
                        )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: CustomButton(text: '다음', height: 70, onPressed: (){
                  print(user.is_teacher);
                  print(user.phone_number);
                  Get.toNamed('/signup/id', arguments: user);
                },),
              ),
            ],
          )),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
