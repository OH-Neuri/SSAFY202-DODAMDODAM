
import 'package:app/components/common/paint_page.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class SignButtonCustom extends StatelessWidget {
  const SignButtonCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 5, 27),
      child: Container(
        height: 28,
        width: 83,
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Center(child: Text("서명하기",style:TextStyle(
                    fontSize:18,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600
                  ) )),
                  actions: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 270,
                          height: 180,
                          child: PaintPage(),
                          decoration: BoxDecoration(
                            border: Border.all(style: BorderStyle.solid, color: Colors.black26),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 80,
                            height: 30,

                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                backgroundColor: Colors.black26,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Text(
                                  "돌아가기",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                          Container(
                            width: 80,
                            height: 30,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                backgroundColor:cardBtnPink,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Text(
                                  "보내기",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                // TODO: 저장 코드 추가
                                Navigator.of(context).pop();
                              },
                            ),
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
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Text(
              "서명하기",
              style: TextStyle(fontSize: 13),
            ),
          ),
        ),
      ),
    );
  }
}
