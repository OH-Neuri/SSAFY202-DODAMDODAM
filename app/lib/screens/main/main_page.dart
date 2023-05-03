import 'package:app/components/common/logout_app_bar.dart';
import 'package:app/components/today/today_food.dart';
import 'package:app/components/today/today_info.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final String year = now.year.toString();
    final String month = now.month.toString();
    final String day = now.day.toString();

    return Scaffold(
      appBar: LogoutAppBar(),
      body: Row(
        children: [
          // 왼쪽 여백
          Expanded(child: SizedBox()),
          // 본문
          Flexible(
            flex: 12,
            child: Column(
              children: [
                // 첫 인사말
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 25, 0, 20),
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
                      Text('융융이맘님, ', style: TextStyle(fontWeight: FontWeight.w700, fontSize: subTitleTextSize)),
                      Text('안녕하세요!', style: TextStyle(fontSize: subTitleTextSize))
                    ],
                  ),
                ),
                // 오늘의 일정
                TodayInfo(year: '2023', month: '5', day: '2'),
                TodayFood(year: '2023', month: '5', day: '2')
              ],
            ),
          ),
          //오른쪽 여백
          Expanded(child: SizedBox())
        ],
      ),
    );
  }
}
