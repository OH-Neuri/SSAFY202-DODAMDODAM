import 'package:app/api/user_service.dart';
import 'package:app/components/common/CustomSnackBar.dart';
import 'package:app/components/common/custom_button.dart';
import 'package:app/components/user/user_textform_field.dart';
import 'package:app/constants.dart';
import 'package:app/root.dart';
import 'package:app/screens/user/Signup_welcome.dart';
import 'package:app/screens/user/signup_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginParent extends StatefulWidget {
  const LoginParent({Key? key}) : super(key: key);

  @override
  State<LoginParent> createState() => _LoginParentState();
}

String id = '';
String pw = '';

class _LoginParentState extends State<LoginParent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
          children: [
            Expanded(child: SizedBox()),
            Flexible(
              flex: 12,
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    margin : EdgeInsets.only(bottom: 60),
                    child: Text('학부모로 로그인하기', style: TextStyle(
                        fontSize: titleTextSize,
                        fontWeight: FontWeight.w700
                    ),),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: UserTextFormField(
                      hint: '아이디를 입력하세요',
                      obscureText: false,
                      onChanged: (val){
                        setState((){
                          id = val;
                        });
                      },),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: UserTextFormField(
                      hint: '비밀번호를 입력하세요',
                      obscureText: true,
                      onChanged: (val){
                        setState(() {
                          pw = val;
                        });
                      },),
                  ),
                  CustomButton(text: '로그인하기', height: 70, onPressed: (){login();},),
                  Padding(padding: EdgeInsets.fromLTRB(0, 40, 0, 10),
                    child: Text('아직 회원이 아니신가요?', style: TextStyle(fontSize: contentTextSize),),
                  ),
                  TextButton(
                    onPressed: (){Get.to(SignupSelect());},
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



  void login() async {
    if(id == '') {
      CustomSnackBar.errorSnackbar(context, '아이디를 입력해주세요.');
      return;
    } else if (pw == '') {
      CustomSnackBar.errorSnackbar(context, '비밀번호를 입력해주세요.');
      return;
    }
    final res = await UserService.userLogin(id, pw, 3);
    if(res.result) {
      if(res.code){
        Get.to(()=>Root());
      }else{
        Get.to(()=>SignupWelcome());
      }
    }else {
      CustomSnackBar.errorSnackbar(context, '아이디나 비밀번호를 다시 확인해주세요.');
      // 아이디로 포커스가 가도록 이동 (추후)
    }
  }
}