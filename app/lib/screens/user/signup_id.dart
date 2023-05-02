import 'package:app/components/common/custom_button.dart';
import 'package:app/components/common/logout_app_bar.dart';
import 'package:app/components/user/user_textform_field.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupId extends StatelessWidget {
  const SignupId({Key? key}) : super(key: key);

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
                      child: Text('아이디를 입력해주세요.', style: TextStyle(
                          fontSize: titleTextSize,
                          fontWeight: FontWeight.w700
                      ),),
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: UserTextFormField(hint: '아이디', obscureText: false, onChanged: (val)=>{},),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text('영문 또는 영문, 숫자 조합 6~12 자리',
                        style: TextStyle(
                          color: Color(0xff797979)
                        ),
                      )
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: CustomButton(text: '다음', height: 70, onPressed: (){},),
              ),
            ],
          )),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
