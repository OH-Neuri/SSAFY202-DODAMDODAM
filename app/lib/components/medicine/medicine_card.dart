import 'package:app/models/medicine/medicine_class_list_model.dart';
import 'package:flutter/material.dart';
import 'package:app/constants.dart';

class MedicineCard extends StatelessWidget {
  final MedicineClassList data;
  const MedicineCard({
    super.key, required this.data,
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
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: CircleAvatar(backgroundImage: NetworkImage(data.photo), ),
              ),
              Text(data.name,style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("투약 여부 :",style: TextStyle(fontSize: 12)),
                      Visibility(
                        visible: data.responseDate==null,
                        replacement: Center(child: Icon(Icons.check_circle_outline_rounded,size: 25, color:cardBtnPink)),
                        child: Center(child: Icon(Icons.check_circle_outline_rounded,size: 25, color: Color(0x70000000))),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          Text("완료 시간 :",style: TextStyle(fontSize: 12)),
                          data.responseDate != null ?
                          Text(data.responseDate): SizedBox()
                        ]
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
