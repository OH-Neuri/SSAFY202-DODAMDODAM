import 'dart:async';
import 'package:flutter/material.dart';

class SignupTimer extends StatefulWidget {
  const SignupTimer({Key? key}) : super(key: key);

  @override
  State<SignupTimer> createState() => _SignupTimerState();
}

int _timeCount = 300;

class _SignupTimerState extends State<SignupTimer> {
  @override
  Widget build(BuildContext context) {
    int minute = _timeCount ~/ 60;
    String second = '${_timeCount % 60}'.padLeft(2, '0');
    return Text('$minute:$second', style: TextStyle(color: Color(0xffc41408)),);
  }
  void _start() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if(_timeCount <= 0) return;
      setState(() {
        _timeCount--;
      });
    });
  }
  @override
  void initState() {
    super.initState();
    _start();
  }
}
