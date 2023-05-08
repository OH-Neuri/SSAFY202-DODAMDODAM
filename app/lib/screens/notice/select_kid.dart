import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Kid {
  final int kidSeq;
  final String name;
  final String photo;

  Kid(this.kidSeq, this.name, this.photo);
}

class SelectKid extends StatefulWidget {
  const SelectKid({Key? key}) : super(key: key);

  @override
  State<SelectKid> createState() => _SelectKidState();
}

List<Kid> kids = [
  Kid(0, '김나현', 'images/bonggil.jpg'),
  Kid(1, '이연희', 'images/sleepingCat.png'),
  Kid(2, '오하늘', 'images/bonggil.jpg'),
];
List<int> kidSeqs = [1, 2];


class _SelectKidState extends State<SelectKid> {
  @override
  void initState() {
    super.initState();
    if(Get.arguments != null) {
      kidSeqs = Get.arguments as List<int>;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightNavy,
      body: Row(
        children: [
          Expanded(child: SizedBox()),
          Flexible(
              flex: 12,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 40.0, 0, 20.0),
                      padding: EdgeInsets.symmetric(vertical: 40),
                      decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Text('원아 선택', style: TextStyle(
                              fontSize: titleTextSize,
                              fontWeight: FontWeight.w700
                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: TextButton(
                              onPressed: (){
                                setState(() {
                                  if(kidSeqs.length == kids.length) {
                                    kidSeqs = [];
                                  }else {
                                    List<int> newList = kids.map((kid) {return kid.kidSeq;}).toList();
                                    kidSeqs = newList;
                                  }
                                });
                              },
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(Colors.white),
                                backgroundColor: MaterialStateProperty.all(Colors.white),
                                foregroundColor: MaterialStateProperty.all(textColor)
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child:
                                      kidSeqs.length == kids.length ?
                                      Icon(Icons.check_box)
                                      :
                                      Icon(Icons.check_box_outline_blank)
                                  ),
                                  Text('전체 선택')
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 20),
                            child: Divider(color: Colors.grey, height: 1, thickness: 1,),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                for(Kid kid in kids)
                                  InkWell(
                                    onTap: (){
                                      setState(() {
                                        if(kidSeqs.contains(kid.kidSeq)){
                                          kidSeqs.remove(kid.kidSeq);
                                        }else{
                                          kidSeqs.add(kid.kidSeq);
                                        }
                                      });
                                    },
                                    child: Container(
                                      height: 70,
                                      padding: EdgeInsets.fromLTRB(40, 10, 50, 10),
                                      decoration: BoxDecoration(
                                        color: kidSeqs.contains(kid.kidSeq) ? Color(0x40D5D5D5) : null
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: CircleAvatar(
                                                radius: 200,
                                                backgroundImage: AssetImage(kid.photo)
                                            ),
                                          ),
                                          Text(kid.name, style: TextStyle(
                                            fontSize: contentTextSize,
                                            fontWeight: FontWeight.w400
                                          ),)
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: darkNavy,
                          foregroundColor: Colors.white,
                          minimumSize: Size(double.infinity, 60)
                        ),
                        child: Text('선택하기')
                    ),
                  )
                ],
              )
          ),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
