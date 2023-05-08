import 'package:app/api/schedule_service.dart';
import 'package:app/constants.dart';
import 'package:app/models/schedule/singleday_schedule_model.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/convert_dayToWeek.dart';

class TodayInfo extends StatefulWidget {
  final String year;
  final String month;
  final String day;
  final String week;

  TodayInfo({super.key, required this.year, required this.month, required this.day})
        : week = getDayOfWeek(int.parse(year), int.parse(month), int.parse(day));

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
    return Column(
      children: [
        // 오늘의 일정 타이틀
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${widget.month}/${widget.day} ${widget.week} ", style: TextStyle(fontSize: buttonTextSize, fontWeight: FontWeight.w600)),
              Image(image: AssetImage('assets/images/common/calendar_icon.png'), height: 30)
            ],
          ),
        ),
        // 일정 내용 박스
        Container(
            height: 200, width: double.infinity,
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
                    itemCount: _scheduleList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _scheduleList[index].classSeq == null ?
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
                                            _scheduleList[index].type,
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
                                    child: Text(_scheduleList[index].content, style: TextStyle(fontSize: buttonTextSize),),
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
                                        _scheduleList[index].type,
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
                                child: Text(_scheduleList[index].content, style: TextStyle(fontSize: buttonTextSize),),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    ),
              ),
            )
        )
      ],
    );
  }
}
