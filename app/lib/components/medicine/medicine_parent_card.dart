
import 'package:flutter/material.dart';
import 'package:app/constants.dart';

class MedicineParentCard extends StatelessWidget {
  const MedicineParentCard({
    super.key,
    required this.i,
  });
  final int i;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
          child: Text('19일',style:TextStyle(
              fontSize: 23,
            fontWeight: FontWeight.w700,
            color: Colors.black87
          )),
        ),
        ElevatedButton(onPressed: (){'/medicine/detail';},
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                backgroundColor: lightPink,
                foregroundColor: textColor,
                minimumSize: Size(100,50),
                padding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 24.0)
            ),
            child:SizedBox(
              height: 60,
              width: 200,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("투약 여부 : ",style: TextStyle(
                            fontSize: 16
                        ),),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Icon(Icons.check_circle_outline_rounded,size: 30, color:cardBtnPink),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("완료 시간 : ",style: TextStyle(
                            fontSize: 16
                        ),),
                        Text("16:00",style: TextStyle(
                              fontSize: 16
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
        )
      ],
    );
  }
}