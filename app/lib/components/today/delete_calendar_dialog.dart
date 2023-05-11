import 'package:app/api/schedule_service.dart';
import 'package:flutter/material.dart';
import 'package:app/constants.dart';

class DeleteCalendarDialog extends StatelessWidget {
  final int scheduleSeq;
  const DeleteCalendarDialog({Key? key, required this.scheduleSeq}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text("일정 삭제",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: buttonTextSize, color: logoNavy)
        )
      ),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      content: Text("해당 일정을 정말로 삭제하시겠습니까?"),
      actions: <Widget>[
        // 취소 버튼
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            height: 30, width: 50, margin: EdgeInsets.fromLTRB(0, 0, 5, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey,
            ),
            child: Center(child: Text('취소')),
          ),
        ),
        // 삭제 버튼
        InkWell(
          onTap: () {
            ScheduleService.deleteSchedule(scheduleSeq);
            Navigator.of(context).pop();
          },
          child: Container(
            height: 30, width: 50, margin: EdgeInsets.fromLTRB(0, 0, 5, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.deepOrange,
            ),
            child: Center(child: Text('삭제')),
          ),
        ),
      ],
    );
  }
}
