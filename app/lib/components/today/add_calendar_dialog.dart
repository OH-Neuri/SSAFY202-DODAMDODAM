import 'package:app/api/schedule_service.dart';
import 'package:app/controller/calendar_type_controller.dart';
import 'package:app/models/schedule/schedule_type_model.dart';
import 'package:flutter/material.dart';
import 'package:app/constants.dart';
import 'package:get/get.dart';

class AddCalendarDialog extends StatefulWidget {
  const AddCalendarDialog({Key? key}) : super(key: key);

  @override
  State<AddCalendarDialog> createState() => _AddCalendarDialogState();
}

class _AddCalendarDialogState extends State<AddCalendarDialog> {
  SingleType choice = SingleType(scheduleTypeSeq: -1, content: '');
  String name = '';
  String alert = '';

  @override
  Widget build(BuildContext context) {
    CalendarTypeController ctc = Get.put(CalendarTypeController());
    return GetBuilder<CalendarTypeController>(
        builder: (_) =>

            AlertDialog(
              title: Center(
                child: Text(
                    "일정 추가",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: subTitleTextSize, color: textColor)),
              ),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              content: SizedBox(
                width: 400,
                child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: DropdownButton(
                                hint: Text("일정 분류 선택"),
                                borderRadius: BorderRadius.circular(20),
                                items: ctc.typeList.map(
                                      (SingleType item) => DropdownMenuItem(
                                    value: item,
                                    child: Text(item.content),
                                  ),
                                ).toList(),
                                onChanged: (value) => setState(() {
                                  choice.scheduleTypeSeq = value!.scheduleTypeSeq;
                                  choice.content = value!.content;
                                }),
                                value: choice.isNull ? choice : null,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text(choice.content),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 6),
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                borderSide: BorderSide.none,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(6.0)),
                              ),
                              hintText: '일정명 입력하기',
                              hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w200),
                              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),

                            ),
                            onChanged: (value) => setState(() {
                              name = value;
                            }),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(alert, style: TextStyle(fontSize: subContentTextSize, color: Colors.red),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 3.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.grey[300],
                                          minimumSize: Size(double.infinity, 44)
                                      ),
                                      onPressed: (){
                                        setState(() {
                                          name = '';
                                          choice = SingleType(scheduleTypeSeq: -1, content: '');
                                        });
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('취소'),
                                    ),
                                  )
                              ),
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 3.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: darkYellow,
                                          minimumSize: Size(double.infinity, 44)
                                      ),
                                      onPressed: (){
                                        addCalendar();
                                      },
                                      child: Text('등록'),
                                    ),
                                  )
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                ),
              ),
              // actions: <Widget>[
              //   // 취소 버튼
              //   InkWell(
              //     onTap: () {
              //       setState(() {
              //         name = '';
              //         choice = SingleType(scheduleTypeSeq: -1, content: '');
              //       });
              //       Navigator.of(context).pop();
              //     },
              //     child: Container(
              //       height: 30, width: 50, margin: EdgeInsets.fromLTRB(0, 0, 5, 10),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20),
              //         color: Colors.grey,
              //       ),
              //       child: Center(child: Text('취소')),
              //     ),
              //   ),
              //   // 등록 버튼
              //   InkWell(
              //     onTap: () {
              //       if (name == '') {
              //         setState(() {
              //           alert = "일정명을 입력해주세요.";
              //         });
              //       }
              //       else if (choice.scheduleTypeSeq == -1) {
              //         setState(() {
              //           alert = "타입을 선택해주세요.";
              //         });
              //       }
              //       else if (name.length > 10) {
              //         setState(() {
              //           alert = "일정명을 10글자 이내로 입력해주세요.";
              //         });
              //       }
              //       else {
              //         ScheduleService.addSchedule(choice, name);
              //         setState(() {
              //           name = '';
              //           choice = SingleType(scheduleTypeSeq: -1, content: '');
              //         });
              //         Navigator.of(context).pop();
              //       }
              //     },
              //     child: Container(
              //       height: 30, width: 50, margin: EdgeInsets.fromLTRB(0, 0, 5, 10),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20),
              //         color: lightNavy,
              //       ),
              //       child: Center(child: Text('등록')),
              //     ),
              //   ),
              // ],
            ));
  }

  void addCalendar() {
    if (name == '') {
      setState(() {
        alert = "일정명을 입력해주세요.";
      });
    }
    else if (choice.scheduleTypeSeq == -1) {
      setState(() {
        alert = "타입을 선택해주세요.";
      });
    }
    else if (name.length > 10) {
      setState(() {
        alert = "일정명을 10글자 이내로 입력해주세요.";
      });
    }
    else {
      ScheduleService.addSchedule(choice, name);
      setState(() {
        name = '';
        choice = SingleType(scheduleTypeSeq: -1, content: '');
      });
      Navigator.of(context).pop();
    }
  }
}
