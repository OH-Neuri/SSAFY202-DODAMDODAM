import 'package:app/api/notice_service.dart';
import 'package:app/components/common/logout_app_bar.dart';
import 'package:app/components/notice/notice_item.dart';
import 'package:app/components/notice/notice_item_announcement.dart';
import 'package:app/constants.dart';
import 'package:app/screens/notice/notice_detail.dart';
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
                                  date: item.date,
                                  content: item.content,
                                  onPressed: (){ Navigator.push(context, MaterialPageRoute(builder:
                                  (context) => NoticeDetailPage(noticeSeq : item.noticeSeq)
                                  ));},
                                ):
                                NoticeItem(
                                  date: item.date,
                                  kids: item.kid,
                                  content: item.content,
                                  onPressed: (){ Navigator.push(context, MaterialPageRoute(builder:
                                      (context) => NoticeDetailPage(noticeSeq : item.noticeSeq)
                                  ));},
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
