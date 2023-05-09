import 'package:app/components/common/custom_button.dart';
import 'package:app/components/common/logout_app_bar.dart';
import 'package:app/components/user/user_textform_field.dart';
import 'package:app/constants.dart';
import 'package:app/models/user/signup_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupId extends StatefulWidget {
  const SignupId({Key? key}) : super(key: key);

  @override
  State<SignupId> createState() => _SignupIdState();
}

SignupUserModel user = Get.arguments;
Text none = Text('영문 또는 영문,숫자 조합 6~12 자리', style: TextStyle(color: Color(0xff797979)),);
Text invalid = Text('영문 또는 영문,숫자 조합 6~12 자리를 입력해주세요.', style: TextStyle(color: Colors.red),);
Text duplication = Text('${user.id}는 사용할 수 없는 아이디입니다.', style: TextStyle(color: Colors.red),);
Text valid = Text('${user.id}는 사용할 수 있는 아이디입니다.', style: TextStyle(color: Color(0xff797979)),);
Text text = none;

class _SignupIdState extends State<SignupId> {
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
                      child: Text('아이디와 이름을 입력해주세요.', style: TextStyle(
                          fontSize: titleTextSize,
                          fontWeight: FontWeight.w700
                      ),),
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: UserTextFormField(hint: '아이디', obscureText: false, onChanged: (val){
                        setState(() {
                          user.id = val;
                          if(user.id.length < 6){
                            text = invalid;
                          }else {
                            text = valid;
                          }
                        });
                      },),
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: text,
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: UserTextFormField(
                        hint: '이름',
                        obscureText: false,
                        onChanged: (val){
                          user.name = val;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: CustomButton(text: '다음', height: 70, onPressed: (){
                  print(user.name);
                  print(user.id);
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
