import 'package:app/components/common/main_icon_button.dart';
import 'package:app/components/common/title_appBar.dart';
import 'package:app/components/today/today_food.dart';
import 'package:app/components/today/today_info.dart';
import 'package:app/constants.dart';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/notification.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(title: ""),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Row(
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
                      padding: const EdgeInsets.fromLTRB(0, 25, 0, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/sleepingCat.png')),
                            ),
                          ),
                          Text('융융이맘님, ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: subTitleTextSize)),
                          Text('안녕하세요!',
                              style: TextStyle(fontSize: subTitleTextSize))
                        ],
                      ),
                    ),
                    Container(
                      // height: 120,
                      margin: EdgeInsets.only(top: 14, bottom: 34),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // 알림장, 등/하원 확인서, 투약 의뢰서
                        children: [
                          Expanded(child: MainIconButton(title: "알림장")),
                          Expanded(child: MainIconButton(title: "등하원 확인서")),
                          Expanded(child: MainIconButton(title: "투약 의뢰서"))
                        ],
                      ),
                    ),
                    // 오늘의 일정
                    TodayInfo(),
                    TodayFood(),
                  ],
                ),
              ),
              //오른쪽 여백
              Expanded(child: SizedBox())
            ],
          ),
        ),
      ),
    );
  }
}
