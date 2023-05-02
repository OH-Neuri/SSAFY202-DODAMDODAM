import 'package:app/components/common/logout_app_bar.dart';
import 'package:app/components/notice/notice_item.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class NoticeList extends StatelessWidget {
  const NoticeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightNavy,
      appBar: LogoutAppBar(),
      body: Row(
        children: [
          Expanded(child: SizedBox()),
          Flexible(flex: 12,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 200,
                        height: 70,
                        child: Text('zzz'),
                      ),
                    ],
                  ),
                  for(int i=0; i<1; i++)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                      child: NoticeItem(
                        date: '2023-04-20',
                        students: '@전체 아동',
                        content: '우아엄라ㅓㅇㄹ마러만ㅇ러;ㅁ널;미너란머람넝라ㅓㄴㅁㄹdfad아엄라ㅓㅇㄹ마러만ㅇ러;ㅁ널;미너란머람넝라ㅓㄴㅁㄹdfad아엄라ㅓㅇㄹ마러만ㅇ러;ㅁ널;미너란머람넝라ㅓㄴㅁㄹdfadkajfajdfkjafsafeiㄴ어ㅏ림;너럼ㅈ댜ㅓㄻ;더라멍;너라ㅣㅓ먖더ㅣㄹ더지ㅏㅓ란ㅁ어럼;니ㅏ얼',
                      ),
                    ),
                  ElevatedButton(onPressed: (){},
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          backgroundColor: lightYellow,
                          foregroundColor: textColor,
                          minimumSize: Size(double.infinity, 120),
                          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0)
                      ),
                      child: SizedBox(
                        height: 120,
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
                                      padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                                      child: Image.asset('images/notice/calendar.png', width: 20,),
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
                                child: Text('룰루랄라',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                )
                            )
                          ],
                        ),
                      )
                  )
                ],
              )
          ),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}