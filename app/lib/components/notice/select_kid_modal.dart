import 'package:app/constants.dart';
import 'package:app/controller/notice_controller.dart';
import 'package:app/models/notice/class_kid_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectKidModal extends StatefulWidget {
  const SelectKidModal({Key? key}) : super(key: key);

  @override
  State<SelectKidModal> createState() => _SelectKidModalState();
}

List<int> selectKidList = <int>[];

class _SelectKidModalState extends State<SelectKidModal> {
  NoticeController nc = Get.put(NoticeController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NoticeController>(builder: (_) =>
        AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 8),
          content: SizedBox(
              width: 400,
              height: 500,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text('원아 선택', style: TextStyle(
                        fontSize: buttonTextSize,
                        fontWeight: FontWeight.w700
                    ),),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            if(selectKidList.length == nc.kidList.length) {
                              selectKidList.clear();
                            }else {
                              selectKidList = nc.kidList.map((kid) {return kid.kidSeq;}).toList();
                            }
                          });
                        },
                        overlayColor: MaterialStateProperty.all(Colors.white),
                        child: Row(
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child:
                                selectKidList.length == nc.kidList.length
                                ? Icon(Icons.check_box, size: 14,)
                                : Icon(Icons.check_box_outline_blank, size: 14,)
                            ),
                            Text('전체 선택', style: TextStyle(fontSize: 14),)
                          ],
                        ),
                      ),
                      Text('총 ${selectKidList.length}명', style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey
                      ),)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Divider(color: Colors.grey, height: 1, thickness: 1,),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          for(ClassKid kid in nc.kidList)
                            InkWell(
                              onTap: (){
                                setState(() {
                                  if(selectKidList.contains(kid.kidSeq)){
                                    selectKidList.remove(kid.kidSeq);
                                  }else{
                                    selectKidList.add(kid.kidSeq);
                                  }
                                });
                              },
                              child: Container(
                                height: 50,
                                padding: EdgeInsets.fromLTRB(4, 6, 0, 6),
                                decoration: BoxDecoration(
                                    color: selectKidList.contains(kid.kidSeq) ? Color(0x407784C1) : null
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      margin: EdgeInsets.only(right: 14),
                                      child: CircleAvatar(
                                          radius: 200,
                                          backgroundColor: Color(0x80D5D5D5),
                                          backgroundImage: NetworkImage(kid.photo)
                                      ),
                                    ),
                                    Text(kid.name, style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400
                                    ),)
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        Expanded(child: Padding(
                          padding: const EdgeInsets.only(right: 3.0),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffB5B5B5)
                              ),
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              child: Text('닫기')),
                        )),
                        Expanded(child: Padding(
                          padding: const EdgeInsets.only(left: 3.0),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: darkNavy
                              ),
                              onPressed: (){
                                nc.setSelectKid(selectKidList);
                                Navigator.pop(context);
                              },
                              child: Text('선택')),
                        )),
                      ],
                    ),
                  )
                ],
              )
          ),
      )
    );
  }
}
