import 'package:app/components/common/title_appBar.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;
import 'package:intl/intl.dart' show DateFormat;

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {

  DateTime _currentDate = DateTime.now();
  DateTime _targetMonth = DateTime.now();
  String _currentMonth = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentMonth = DateFormat.yMMM().format(_targetMonth);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(title: "일정 및 식단 확인"),
      body:Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: CalendarCarousel<Event>(
              onDayPressed: (DateTime date, List<Event> events) {
                setState(() => _currentDate = date);
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
              height: 420.0,
              selectedDateTime: _currentDate,
              daysHaveCircularBorder: null, /// null for not rendering any border, true for circular border, false for rectangular border
            ),
          ),
          // 일정, 급식 버튼
          Row(
            children: [
              // 왼쪽 여백
              Expanded(child: SizedBox()),
              //본문
              Flexible(
                  flex: 12,
                  child: Text('체크')
              ),
              //오른쪽 여백
              Expanded(child: SizedBox())
            ],
          )
        ],
      ),
    );
  }
}
