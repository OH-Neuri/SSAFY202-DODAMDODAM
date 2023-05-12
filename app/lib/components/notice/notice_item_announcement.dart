import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class NoticeItemAnnouncement extends StatelessWidget {
  final String date;
  final String content;
  final Function() onPressed;

  const NoticeItemAnnouncement({required this.date, required this.content, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: ElevatedButton(onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              backgroundColor: lightYellow,
              foregroundColor: textColor,
              minimumSize: Size(double.infinity, 120),
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0)
          ),
          child: SizedBox(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('2023-05-03'),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(6.0, 0, 0, 0),
                          child: Image.asset('assets/images/notice/calendar.png', width: 20,),
                        )
                      ],
                    ),
                    Text('전체 공지', style: TextStyle(
                      color: textColor,
                    ),)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 16),
                  child: Divider(thickness: 1, height: 1, color: Colors.grey,),
                ),
                SizedBox(
                    width: double.infinity,
                    child: Text(content,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    )
                )
              ],
            ),
          )
      ),
    );
  }
}