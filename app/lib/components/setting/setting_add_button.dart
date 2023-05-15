import 'package:app/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class SettingAddButton extends StatelessWidget {
  final String text;
  final Widget widget;

  const SettingAddButton({super.key, required this.text, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: InkWell(
        onTap: (){
          showDialog(
              context: context,
              barrierDismissible: true, // 바깥 터치 할 시 닫음
              builder: (BuildContext context) {
                return widget;
              }
          );
        },
        child: DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(10),
            color: Colors.grey,
            dashPattern: [4,4],
            child: SizedBox(
              height: 60,
              width: double.infinity,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: Icon(Icons.add, color: Colors.grey,),
                    ),
                    Text('$text 추가하기', style: TextStyle(
                        fontSize: contentTextSize,
                        color: Colors.grey
                    ),),
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}