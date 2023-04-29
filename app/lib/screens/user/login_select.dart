import 'package:flutter/material.dart';

class LoginSelect extends StatelessWidget {
  const LoginSelect({Key? key}) : super(key: key);

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png', height: 150),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: RoundButton(text: '학부모로 로그인하기', color: 0xffFFB900,)
                        ),
                        RoundButton(text: '교사로 로그인하기', color: 0xff7784C1,)
                      ],
                    ),
                  )
                ]
            ),
          ),
          Expanded(child: SizedBox())
        ],

      )
    );
  }
}

class RoundButton extends StatelessWidget {

  final String text;
  final int color;

  const RoundButton({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){},
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16
          ),
          minimumSize: Size(double.infinity, 66),
          backgroundColor: Color(color),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          )
        ),
        child: Text(text)
    );
  }
}
