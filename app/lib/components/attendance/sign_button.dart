
import 'package:app/components/attendance/paint_page.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class SignButton extends StatelessWidget {
  const SignButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 90, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("2022년 8월 13일 김부모",  style: TextStyle(fontSize: 20)),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SignButtonCustom(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SignButtonCustom extends StatelessWidget {
  const SignButtonCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 5, 20),
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Center(child: Text("서명하기",style:TextStyle(
                  fontSize:22,
                  color: Colors.black87,
                ) )),
                actions: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 350,
                        height: 200,
                        child: PaintPage(),
                        decoration: BoxDecoration(
                          border: Border.all(style: BorderStyle.solid, color: Colors.black26),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 35, 0, 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Colors.black26,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "돌아가기",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            backgroundColor:cardBtnPink,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "보내기",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          onPressed: () {
                            // TODO: 저장 코드 추가
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          );
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black26,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            "서명하기",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
