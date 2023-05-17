import 'package:app/api/notice_service.dart';
import 'package:app/components/common/logout_app_bar.dart';
import 'package:app/components/notice/notice_item.dart';
import 'package:app/components/notice/notice_item_announcement.dart';
import 'package:app/constants.dart';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/screens/notice/notice_detail.dart';
import 'package:app/screens/notice/notice_regist.dart';
import 'package:flutter/material.dart';
import 'package:app/models/notice/notice_list_model.dart';
import 'package:get/get.dart';

class NoticeList extends StatefulWidget {
  const NoticeList({Key? key}) : super(key: key);
  @override
  State<NoticeList> createState() => _NoticeListState();
}

class _NoticeListState extends State<NoticeList> {
  List<NoticeListItem> _noticeList = <NoticeListItem>[];
  int kidCnt = 0;
  bool isTeacher = false;

  @override
  void initState() {
    super.initState();
    getNoticeListInfo();
    NoticeService.getClassKidList().then((value) => {
      setState((){
        kidCnt = value.length;
      })
    });
    DeviceInfoController c = Get.put(DeviceInfoController());
    setState(() {
      isTeacher = c.isTeacher;
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
                                  onPressed: () async {
                                    final res = await Navigator.push(context, MaterialPageRoute(builder:
                                        (context) => NoticeDetailPage(noticeSeq : item.noticeSeq)
                                    ));
                                    if(res) {
                                      getNoticeListInfo();
                                    }
                                  },
                                ):
                                NoticeItem(
                                  date: item.date,
                                  kids: item.kid.length == kidCnt ? '@전체 원생' : (item.kid.length == 1 ? '@${item.kid[0]}' :'@${item.kid[0]} 외 ${item.kid.length - 1}명'),
                                  content: item.content,
                                  onPressed: () async {
                                    final res = await Navigator.push(context, MaterialPageRoute(builder:
                                        (context) => NoticeDetailPage(noticeSeq : item.noticeSeq)
                                    ));
                                    if(res) {
                                      getNoticeListInfo();
                                    }
                                  },
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
            isTeacher ?
            Positioned(
                bottom: 20,
                right: 30,
                child: ElevatedButton(
                  onPressed: () async {
                    final res = await Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>NoticeRegist()));
                    if(res) {
                      getNoticeListInfo();
                    }
                  },
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
            ) :
            SizedBox()
          ]
      ),
    );
  }

  void getNoticeListInfo() {
    NoticeService.getNoticeList().then((value) => {
      setState((){
        _noticeList = value;
      })
    });
  }
}