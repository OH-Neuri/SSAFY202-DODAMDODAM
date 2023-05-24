import 'package:app/constants.dart';
import 'package:app/controller/today_controller.dart';
import 'package:app/models/schedule/singleday_schedule_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'oneline_schedule.dart';

class TodayInfo extends StatelessWidget {
  const TodayInfo({super.key});

  @override
  Widget build(BuildContext context) {
    TodayController tc = Get.put(TodayController());

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
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Opacity(
                                  opacity: 0.9,
                                  child: Image(image: AssetImage('assets/images/common/달력.png'), height: 24)),
                            ),
                            Text(
                              // "${tc.now.month}/${tc.now.day} ${tc.todayWeek} ",
                                '오늘의 일정',
                                style: TextStyle(
                                    fontSize: buttonTextSize,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[800]
                                )
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // 일정 내용 박스
                Container(
                  height: 200, width: double.infinity,
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: lightYellow,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 5.0,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox (
                          height: 160,
                          child: ListView.builder(
                              itemCount: tc.todayScheduleList.length,
                              itemBuilder: (BuildContext context, int index) {
                                OneSchedule oneSchedule = tc.todayScheduleList[index];
                                return oneSchedule.classSeq == null ?
                                OneLineSchedule(isClass: true, isTeacher: false, type: oneSchedule.type, content: oneSchedule.content, scheduleSeq: -1)
                                    : OneLineSchedule(isClass: false, isTeacher: false, type: oneSchedule.type, content: oneSchedule.content, scheduleSeq: oneSchedule.scheduleSeq);
                              }
                          )
                      )
                  ),
                )
              ],
            )
    );
  }
}
