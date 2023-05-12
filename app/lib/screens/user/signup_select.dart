import 'package:app/components/common/custom_button.dart';
import 'package:app/components/common/logout_app_bar.dart';
import 'package:app/constants.dart';
import 'package:app/models/user/signup_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupSelect extends StatefulWidget {
  const SignupSelect({Key? key}) : super(key: key);

  @override
  State<SignupSelect> createState() => _SignupSelectState();
}

int idx = -1;
SignupUser user = SignupUser(id: '', pw: '', phone_number: '', name: '', is_teacher: false);

class _SignupSelectState extends State<SignupSelect> {
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
                      child: Text('하나를 선택해주세요.', style: TextStyle(
                          fontSize: titleTextSize,
                          fontWeight: FontWeight.w700
                      ),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              ElevatedButton(onPressed: (){
                                setState(() {
                                  idx = 1;
                                  user.is_teacher = true;
                                });
                              },
                                style: ElevatedButton.styleFrom(
                                    shadowColor: Colors.grey,
                                    backgroundColor: idx != 1 ? Colors.white : lightYellow,
                                    minimumSize: Size(100, 140),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))
                                ),
                                child: Image.asset('images/signup/teacher.png', width: 100, height: 100,),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Text('교사', style: TextStyle(fontSize: contentTextSize),),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              ElevatedButton(onPressed: (){
                                setState(() {
                                  idx = 2;
                                  user.is_teacher = false;
                                });
                              },
                                style: ElevatedButton.styleFrom(
                                    shadowColor: Colors.grey,
                                    backgroundColor: idx != 2 ? Colors.white : lightYellow,
                                    minimumSize: Size(100, 140),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))
                                ),
                                child: Image.asset('images/signup/mother.png', width: 100, height: 100,),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Text('학부모', style: TextStyle(fontSize: contentTextSize),),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: CustomButton(text: '다음', height: 70, onPressed: (){
                  if(idx == -1){
                    print('입력해야지');
                    return;
                  }
                  Get.toNamed('/signup/number', arguments: user);
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
