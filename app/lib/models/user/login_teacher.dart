import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class LoginTeacher extends StatelessWidget {
  const LoginTeacher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(child: SizedBox()),
          Flexible(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin : EdgeInsets.fromLTRB(0, 0, 0, 60),
                  child: Text('교사로 로그인하기', style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700
                  ),),
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: renderLoginTextFormField(hint: '아이디를 입력하세요', obscureText: false),
                ),
                renderLoginTextFormField(hint: '비밀번호를 입력하세요', obscureText: true),
              ],
            ),
          ),
          Expanded(child: SizedBox()),
        ],
      )
    );
  }
}

renderLoginTextFormField({
  required String hint,
  // required FormFieldSetter onChanged,
  required bool obscureText,
}) {
  // assert(onChanged != null);

  return TextFormField(
    keyboardType: TextInputType.text,
    textInputAction: TextInputAction.next,
    cursorColor: logoNavy,
    // onChanged: (){},
    obscureText: obscureText,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.all(16),
      hintText: hint,
      hintStyle: TextStyle(
        color: Colors.grey,
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide: BorderSide(color: Colors.black26)),
      filled: true,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide: BorderSide(color: darkYellow)),
    ),
  );
}