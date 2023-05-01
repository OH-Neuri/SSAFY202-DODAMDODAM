import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class TodayInfo extends StatelessWidget {
  final String title;
  final String year;
  final String month;
  final String day;

  const TodayInfo({required this.title, required this.year, required this.month, required this.day});

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
                Text('$title', style: TextStyle(fontSize: 24)),
              ],
            ),
          ),
          Container(
            height: 300, width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                color: mainPink,
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
                  Text("date1"),
                  Text("date2"),
                  Text("date3")
                ],
              ),
            )
          )
        ],
      )
    );
  }
}
