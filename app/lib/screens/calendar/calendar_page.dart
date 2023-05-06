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
      appBar: LogoutAppBar(),
      body: Container(
        child: Text('여기는 캘린더 페이지'),
      ),
    );
  }
}
