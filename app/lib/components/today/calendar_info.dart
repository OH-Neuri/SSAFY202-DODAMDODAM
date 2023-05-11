import 'package:app/components/today/add_calendar_dialog.dart';
import 'package:app/constants.dart';
import 'package:app/controller/calendar_type_controller.dart';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/controller/today_controller.dart';
import 'package:app/models/schedule/singleday_schedule_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 일정에서 선택한 날짜의 일정 리스트를 보여주기 위한 컴포넌트
class CalendarInfo extends StatelessWidget {
  const CalendarInfo({super.key});

  @override
  Widget build(BuildContext context) {
    TodayController tc = Get.put(TodayController());
    CalendarTypeController ctc = Get.put(CalendarTypeController());

    return GetBuilder<TodayController>(
        builder: (_) =>
      Column(
      children: [
        // 오늘의 일정 타이틀
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                      Text(
                          "${tc.choiceDay.month}/${tc.choiceDay.day} ${tc.dayWeek} ",
                          style: TextStyle(fontSize: buttonTextSize, fontWeight: FontWeight.w600)
                  ),
                  Image(image: AssetImage('assets/images/common/calendar_icon.png'), height: 30)
                ],
              ),
              // 일정 추가하는 버튼
              DeviceInfoController.to.isTeacher?
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      CalendarTypeController.to.setTypeList();
                      showDialog(
                          context: context,
                          barrierDismissible: true, // 바깥 터치 할 시 닫음
                          builder: (BuildContext context) {
                            return AddCalendarDialog();
                          }
                      );
                    },
                    child: Container(
                      width: 30, height: 30,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: cardBtnPink, borderRadius: BorderRadius.circular(20)),
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  )
                ],
              ) : SizedBox(),
            ],
          ),
        ),
        // 일정 내용 박스
        Container(
            height: 200, width: double.infinity,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: lightYellow,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 5.0,
                  offset: Offset(0, 10), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox (
                  height: 160,
                  child: ListView.builder(
                    itemCount: tc.scheduleList.length,
                      itemBuilder: (BuildContext context, int index) {
                        OneSchedule oneschedule = tc.scheduleList[index];
                        return oneschedule.classSeq == null ?
                            // 어린이집 일정
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(color: cardBtnPink, borderRadius: BorderRadius.circular(20)),
                                  height: 30,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          oneschedule.type,
                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: buttonTextSize)
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                                  child: Text(oneschedule.content, style: TextStyle(fontSize: buttonTextSize),),
                                ),
                              ),
                            ],
                          ),
                        )
                            :
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(color: darkYellow, borderRadius: BorderRadius.circular(20)),
                                  height: 30,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          oneschedule.type,
                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: buttonTextSize)
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                                  child: Text(oneschedule.content, style: TextStyle(fontSize: buttonTextSize),),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                  ),
                  )
              ),
            )
      ],
    ));
  }
}
