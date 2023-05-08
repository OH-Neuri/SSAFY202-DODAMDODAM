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
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Row(
                    children: [
                      Expanded(child: SizedBox()),
                      Flexible(flex: 12,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  children: [
                                    Expanded(child: SizedBox(
                                      height: 50,
                                      child: Text('날짜 picker'),
                                    )),
                                    Expanded(child: SizedBox(
                                      height: 50,
                                      child: Text('검색창'),
                                    ))
                                  ],
                                ),
                              ),
                              for(NoticeListItem item in _noticeList)
                                item.announcement ?
                                NoticeItemAnnouncement(
                                  noticeSeq: item.noticeSeq,
                                  date: item.date,
                                  content: item.content,
                                ):
                                NoticeItem(
                                  noticeSeq: item.noticeSeq,
                                  date: item.date,
                                  kids: item.kid,
                                  content: item.content,
                                ),
                            ],
                          )
                      ),
                      Expanded(child: SizedBox()),
                    ],
                  ),
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

class NoticeItemAnnouncement extends StatelessWidget {
  final int noticeSeq;
  final String date;
  final String content;

  const NoticeItemAnnouncement({required this.noticeSeq, required this.date, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: ElevatedButton(onPressed: (){Get.toNamed('/notice/detail');},
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
                    child: Text('룰루랄라',
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