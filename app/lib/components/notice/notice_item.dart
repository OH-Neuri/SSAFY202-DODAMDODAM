import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class NoticeItem extends StatelessWidget {
  final int noticeSeq;
  final String date;
  final List<String> kids;
  final String content;

  const NoticeItem({required this.noticeSeq, required this.date, required this.kids, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ElevatedButton(onPressed: (){},
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              backgroundColor: Colors.white,
              foregroundColor: textColor,
              minimumSize: Size(double.infinity, 100),
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
                        Text(date),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                          child: Image.asset('assets/images/notice/calendar.png', width: 20,),
                        )
                      ],
                    ),
                    Text(kids[0],
                      style: TextStyle(color: Colors.grey),),
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
