
import 'package:app/components/common/paint_page.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class MedicineSignButton extends StatelessWidget {
  const MedicineSignButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SignButtonCustom();
  }
}

class SignButtonCustom extends StatelessWidget {
  const SignButtonCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Center(child: Text("서명하기",style:TextStyle(
                  fontSize:25,
                  color: Colors.black87,
                  fontWeight: FontWeight.w700
                ) )),
                actions: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("금일 본 유치원/어린이집의 '이연희' 아동에 대해 ", style: TextStyle(
                        fontSize: 18),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("의뢰하신 내용대로 투약하였음을 보고합니다." , style: TextStyle(
                      fontSize: 18),),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 350,
                        height: 200,
                        margin: EdgeInsets.only(top: 25),
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
          child: Text("서명하기", style: TextStyle(fontSize: 16)),
          style: ElevatedButton.styleFrom(
            backgroundColor: cardBtnPink,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}
