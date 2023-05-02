import 'package:app/components/common/custom_button.dart';
import 'package:app/components/common/logout_app_bar.dart';
import 'package:app/components/user/user_textform_field.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginTeacher extends StatelessWidget {
  const LoginTeacher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoutAppBar(),
      body: Row(
        children: [
          Expanded(child: SizedBox()),
          Flexible(
            flex: 5,
            child: Column(
              children: [
                Container(
                  margin : EdgeInsets.fromLTRB(0, 40, 0, 60),
                  child: Text('교사로 로그인하기', style: TextStyle(
                    fontSize: titleTextSize,
                    fontWeight: FontWeight.w700
                  ),),
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: UserTextFormField(hint: '아이디를 입력하세요', obscureText: false, onChanged: (val)=>{},),
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: UserTextFormField(hint: '비밀번호를 입력하세요', obscureText: true, onChanged: (val)=>{},),
                ),
                CustomButton(text: '로그인하기', height: 70, onPressed: (){},),
                Padding(padding: EdgeInsets.fromLTRB(0, 40, 0, 10),
                  child: Text('아직 회원이 아니신가요?', style: TextStyle(fontSize: contentTextSize),),
                ),
                TextButton(
                  onPressed: (){Get.toNamed('/signupnumber');},
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.white)
                  ),
                  child: Text('회원가입 하러가기', style: TextStyle(
                    color: textColor,
                    fontSize: contentTextSize,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w700
                  ),),
                )
              ],
            ),
          ),
          Expanded(child: SizedBox()),
        ],
      )
    );
  }
}