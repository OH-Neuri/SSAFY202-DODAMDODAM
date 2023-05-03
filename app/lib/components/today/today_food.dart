import 'package:app/utils/convert_dayToWeek.dart';
import 'package:flutter/material.dart';
import 'package:app/constants.dart';

class TodayFood extends StatefulWidget {
  final String year;
  final String month;
  final String day;
  final String week;

  TodayFood({super.key, required this.year, required this.month, required this.day})
    : week = getDayOfWeek(int.parse(year), int.parse(month), int.parse(day));
  @override
  State<TodayFood> createState() => _TodayFoodState();
}

class _TodayFoodState extends State<TodayFood> {
  // 처음에 오늘 급식 리스트 받아와서 띄워주기

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 오늘의 급식 타이틀
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 5),
          child: Row(
            children: [
              Text("${widget.month}/${widget.day} ${widget.week} 식단", style: TextStyle(fontSize: buttonTextSize, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        // 급식 내용 박스
        Container(
            height: 250, width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              color: lightNavy,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 5.0,
                  offset: Offset(0, 10),
                ),
              ],
            ),
          child: Row(
            children: [
              // 점심 내용
              Expanded(
                child: Text('점심 내용')
              ),
              // 간식 내용
              Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Text('오전 간식'),
                      ),
                      Expanded(
                        child: Text('오후 간식'),
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
      ],
    );
  }
}
