import 'package:flutter/material.dart';

String timeToString(TimeOfDay time) {
  String hour = time.hour.toString().padLeft(2, '0');
  String minute = time.minute.toString().padLeft(2, '0');
  return '$hour:$minute:00';
}

TimeOfDay stringToTime(String time) {
  return TimeOfDay(hour: int.parse(time.split(':')[0]), minute: int.parse(time.split(':')[1]));
}

String notiTime(DateTime time) {
  DateTime now = DateTime.now();
  if (time.year == now.year && time.month == now.month && time.day == now.day) {
    return "${time.hour}:${time.minute}";
  }
  else if (time.year != now.year) {
    return "${now.year - time.year}년 전";
  }
  else if (time.month != now.month) {
    return "${now.month - time.month}개월 전";
  }
  else {
    return "${now.day - time.day}일 전";
  }
}