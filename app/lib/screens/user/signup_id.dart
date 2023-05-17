import 'package:app/api/user_service.dart';
import 'package:app/components/common/custom_snackbar.dart';
import 'package:app/components/common/custom_button.dart';
import 'package:app/components/user/signup_step.dart';
import 'package:app/components/user/user_textform_field.dart';
import 'package:app/constants.dart';
import 'package:app/models/user/signup_user.dart';
import 'package:app/screens/user/signup_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupId extends StatefulWidget {
  const SignupId({Key? key}) : super(key: key);

  @override
  State<SignupId> createState() => _SignupIdState();
}

SignupUserModel user = Get.arguments;
bool able = false;
Text none = Text('영문 또는 영문,숫자 조합 6~12 자리', style: TextStyle(color: Color(0xff797979)),);
Text text = none;


class _SignupIdState extends State<SignupId> {
  Future<void> getIdValid(String id) async {
    if(id.length < 6){
      setState(() {
        able = false;
        text = Text('영문 또는 영문,숫자 조합 6~12 자리를 입력해주세요.', style: TextStyle(color: Colors.red),);
      });
      return;
    }else if (id.length > 12){
      setState(() {
        able = false;
        text = Text('영문 또는 영문,숫자 조합 6~12 자리를 입력해주세요.', style: TextStyle(color: Colors.red),);
      });
      return;
    }
    final res = await UserService.idDuplicationCheck(id);
    if(res) {
      setState(() {
        able = true;
        text = Text('$id는 사용할 수 있는 아이디입니다.', style: TextStyle(color: Color(0xff797979)),);
      });
    }else{
      setState(() {
        able = false;
        text = Text('$id는 사용할 수 없는 아이디입니다.', style: TextStyle(color: Colors.red),);
      });
    }
  }
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
                    SignupStep(step: 2),
                    Container(
                      margin : EdgeInsets.only(bottom: 60),
                      child: Text('아이디와 이름을 입력해주세요.', style: TextStyle(
                          fontSize: titleTextSize,
                          fontWeight: FontWeight.w700
                      ),),
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: UserTextFormField(
                        hint: '아이디',
                        obscureText: false,
                        onChanged: (val){
                        setState(() {
                          user.id = val;
                          getIdValid(val);
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
                child: CustomButton(
                  text: '다음',
                  height: 70,
                  onPressed: (){
                    idAndNameCheck();
                  },),
              ),
            ],
          )),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  void idAndNameCheck() {
    if(user.id == ''){
      CustomSnackBar.errorSnackbar(context, '아이디를 입력해주세요.');
      return;
    } else if(!able) {
      CustomSnackBar.errorSnackbar(context, '올바른 아이디를 입력해주세요,');
      return;
    } else if(user.name == ''){
      CustomSnackBar.errorSnackbar(context, '이름을 입력해주세요.');
      return;
    }
    print(user.name);
    print(user.id);
    Get.to(SignupPassword(), arguments: user);
  }
}
