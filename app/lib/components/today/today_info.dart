import 'package:app/api/schedule_service.dart';
import 'package:app/constants.dart';
import 'package:app/models/schedule/singleday_schedule_model.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/convert_dayToWeek.dart';

class TodayInfo extends StatefulWidget {
  final String title;
  final String year;
  final String month;
  final String day;
  final Color titleColor;
  final String week;

  TodayInfo({required this.title, required this.year, required this.month, required this.day})
      : titleColor = title == '오늘의 일정 📆' ? cardYellow : title == '오늘의 식단 📆' ? lightNavy : Colors.green,
        week = getDayOfWeek(int.parse(year), int.parse(month), int.parse(day));

  @override
  State<TodayInfo> createState() => _TodayInfoState();
}

class _TodayInfoState extends State<TodayInfo> {
  List<OneSchedule> _scheduleList = <OneSchedule>[];
  bool loading = false;

  // 처음에 scheduleList를 받아와서 띄워주기
  @override
  void initState() {
    super.initState();
    ScheduleService.getOneDayScheduleList(widget.year, widget.month, widget.day).then((value) => {
      setState(() {
        _scheduleList = value;
        loading = true;
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Text(widget.title, style: TextStyle(fontSize: subTitleTextSize, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            Container(
                height: 300, width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  color: widget.titleColor,
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
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("${widget.month}/${widget.day} ${widget.week}"),
                    ],
                  ),
                )
            )
          ],
        )
    );
  }
}
