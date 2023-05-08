import 'package:app/components/common/title_appBar.dart';
import 'package:flutter/material.dart';
import 'package:app/components/common/logout_app_bar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(title: "일정 및 식단 확인"),
      body: Container(
        child: Text('여기는 캘린더 페이지'),
      ),
    );
  }
}
