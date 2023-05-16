import 'package:app/constants.dart';
import 'package:flutter/material.dart';

void checkDelete(BuildContext context, Function onPressed) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            width: 600,
            height: 200,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 4),
                    child: Text('삭제 후 복구할 수 없습니다.', style: TextStyle(
                        fontSize: subContentTextSize,
                        color: Colors.grey
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text('정말 삭제하시겠습니까?', style: TextStyle(
                        fontSize: buttonTextSize,
                        fontWeight: FontWeight.w600
                    ),),
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.pop(context);
                          onPressed();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: darkNavy,
                        ),
                        child: Text('삭제하기'),
                      )),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all(Color(0x40D5D5D5))
                        ),
                        child: Text('취소', style: TextStyle(
                          color: textColor,
                        ),)
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }
  );
}