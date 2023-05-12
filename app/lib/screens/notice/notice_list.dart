import 'package:app/api/notice_service.dart';
import 'package:app/components/common/logout_app_bar.dart';
import 'package:app/components/notice/notice_item.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/models/notice/notice_list_model.dart';

class NoticeList extends StatefulWidget {
  const NoticeList({Key? key}) : super(key: key);

  @override
  State<NoticeList> createState() => _NoticeListState();
}

class _NoticeListState extends State<NoticeList> {
  List<NoticeListItem> _noticeList = <NoticeListItem>[];

  @override
  void initState() {
    super.initState();
    NoticeService.getNoticeList().then((value) => {
      setState((){
        _noticeList = value;
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightNavy,
      appBar: LogoutAppBar(),
      body: Stack(
          children: [
            Positioned(
              child: SingleChildScrollView(
                child: Row(
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
                            for(NoticeListItem item in _noticeList)
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                                child: NoticeItem(
                                  date: item.date,
                                  students: '@전체 아동',
                                  content: item.content,
                                ),
                              ),
                            ElevatedButton(onPressed: (){Get.toNamed('/notice/detail');},
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
              ),
            ),
            Positioned(
                bottom: 40,
                right: 40,
                child: ElevatedButton(
                  onPressed: (){Get.toNamed('notice/regist');},
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(80, 80),
                      backgroundColor: logoNavy,
                      foregroundColor: Colors.white,
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)
                      )
                  ),
                  child: Icon(Icons.create),
                )
            )
          ]
      ),
    );
  }
}