import 'package:app/components/today/today_info.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(child: SizedBox()),
          Flexible(
            flex: 12,
            child: Column(
              children: [
                // 첫 인사말
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: SizedBox(
                          width: 50, height: 50,
                          child: CircleAvatar(
                              backgroundImage: AssetImage('assets/images/sleepingCat.png')
                          ),
                        ),
                      ),
                      Text('융융이맘님, ', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24)),
                      Text('안녕하세요!', style: TextStyle(fontSize: 24))
                    ],
                  ),
                ),
                // 오늘의 일정 / 오늘의 식단
                Row(
                  children: [
                    Expanded(
                        child: TodayInfo(title: "오늘의 일정 📆", year: "2023", month: "4", day: "30"),
                    ),
                    Expanded(
                        child: TodayInfo(title: "오늘의 식단 📆", year: "2023", month: "4", day: "30"),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(child: SizedBox())
        ],
      ),
    );
  }
}
