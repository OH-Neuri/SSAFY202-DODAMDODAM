import 'package:app/components/common/title_appBar.dart';
import 'package:app/components/today/calendar_food.dart';
import 'package:app/components/today/calendar_info.dart';
import 'package:app/constants.dart';
import 'package:app/controller/food_controller.dart';
import 'package:app/controller/today_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  bool isInfo = true;
  DateTime day = DateTime.now();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: TitleAppBar(title: "어린이집 일정 및 식단"),
      body:SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Row(
            children: [
              // 왼쪽 여백,
              Expanded(child: SizedBox()),
              //본문
              Flexible(
                  flex: 12,
                  child: Column(
                    children: [
                      // 1. 달력
                      Container(
                        child: CalendarCarousel<Event>(
                          onDayPressed: (DateTime date, List<Event> events) {
                            TodayController.to.setOneDayInfo(date);
                            FoodController.to.setOneDayFood(date);
                            setState(() {
                              day = date;
                            });
                          },
                          weekendTextStyle: TextStyle(color: Colors.red),
                          thisMonthDayBorderColor: Colors.grey,
                          customDayBuilder: (   /// you can provide your own build function to make custom day containers
                              bool isSelectable,
                              int index,
                              bool isSelectedDay,
                              bool isToday,
                              bool isPrevMonthDay,
                              TextStyle textStyle,
                              bool isNextMonthDay,
                              bool isThisMonthDay,
                              DateTime day,
                              ) {
                          },
                          headerTextStyle: TextStyle(fontSize: subTitleTextSize, fontWeight: FontWeight.w700, color: Colors.black),
                          iconColor: Colors.black,
                          todayButtonColor: cardBtnPink,
                          selectedDayButtonColor: darkNavy,
                          weekdayTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                          weekFormat: false,
                          // markedDatesMap: _markedDateMap, --->?
                          height: 380.0,
                          selectedDateTime: day,
                          daysHaveCircularBorder: null, /// null for not rendering any border, true for circular border, false for rectangular border
                        ),
                      ),
                      // 2. 일정? 급식? 선택 버튼----------------------------------------------
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {setState(() => isInfo = true); },
                              child: Chip(
                                labelPadding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                                shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                backgroundColor: isInfo ? mainPink : Colors.grey,
                                label: Text("일정", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: InkWell(
                                onTap: () {setState(() => isInfo = false); },
                                child: Chip(
                                  labelPadding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                                  shape: ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  backgroundColor: isInfo ? Colors.grey : mainPink,
                                  label: Text("식단", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      // 3. 일정, 급식 컴포넌트----------------------------------------------
                      isInfo ? CalendarInfo(): CalendarFood(),
                    ],
                  )
              ),
              // 오른쪽 여백
              Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
