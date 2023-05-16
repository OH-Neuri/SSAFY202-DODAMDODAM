import 'package:flutter/material.dart';
import 'package:app/constants.dart';

class MedicineCard extends StatelessWidget {
  final name = "";
  const MedicineCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(  //모서리를 둥글게 하기 위해 사용
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 4.0, //그림자 깊이
      color: cardYellow,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.circle,size: 50, color:Colors.white),
              Text("이연희",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("투약 여부 :",style: TextStyle(fontSize: 12)),
                        Icon(Icons.check_circle_outline_rounded,size: 23, color:TextYellow),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                            Text("완료 시간 :",style: TextStyle(fontSize: 12)),
                            Text("18:00"),
                          ]
                      ),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
