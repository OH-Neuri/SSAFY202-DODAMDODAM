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
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: buttonTextSize, color: textColor)
        )
      ),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      content: Container(
        height: 140,
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Text("삭제한 일정은 다시 복구할 수 없습니다.", style: TextStyle(fontSize: 14, color: Colors.grey[700]),),
            Text("해당 일정을 정말로 삭제하시겠습니까?"),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300]
                        ),
                        child: Text('취소')),
                  )),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: ElevatedButton(
                        onPressed: (){
                          ScheduleService.deleteSchedule(scheduleSeq);
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: darkYellow
                        ),
                        child: Text('삭제')),
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
