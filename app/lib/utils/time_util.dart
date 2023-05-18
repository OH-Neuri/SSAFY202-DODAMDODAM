import 'package:flutter/material.dart';

String timeToString(TimeOfDay time) {
  String hour = time.hour.toString().padLeft(2, '0');
  String minute = time.minute.toString().padLeft(2, '0');
  return '$hour:$minute:00';
}

TimeOfDay stringToTime(String time) {
  return TimeOfDay(hour: int.parse(time.split(':')[0]), minute: int.parse(time.split(':')[1]));
}