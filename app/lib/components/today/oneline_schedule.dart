import 'package:app/components/today/delete_calendar_dialog.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class OneLineSchedule extends StatelessWidget {
  final bool isClass;
  final bool isTeacher;
  final String type;
  final String content;
  final int scheduleSeq;

  const OneLineSchedule({Key? key, required this.isClass, required this.isTeacher, required this.type, required this.content, required this.scheduleSeq}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: isClass ? cardBtnPink : darkYellow,
                  borderRadius: BorderRadius.circular(20)),
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(type, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(content),
                  isTeacher ?
                  InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (BuildContext context) {
                              return DeleteCalendarDialog(scheduleSeq: scheduleSeq);
                            }
                        );
                      },
                      child: Icon(Icons.delete, color: Color(0x50000000),)
                  )
                      : SizedBox()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
