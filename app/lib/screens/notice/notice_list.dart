import 'package:app/components/common/logout_app_bar.dart';
import 'package:app/components/notice/notice_item.dart';
import 'package:app/components/notice/notice_item_announcement.dart';
import 'package:app/components/notice/notice_month_picker.dart';
import 'package:app/constants.dart';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/controller/notice_controller.dart';
import 'package:app/screens/notice/notice_detail.dart';
import 'package:app/screens/notice/notice_regist.dart';
import 'package:flutter/material.dart';
import 'package:app/models/notice/notice_list_model.dart';
import 'package:get/get.dart';

class NoticeList extends StatelessWidget {
  const NoticeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceInfoController dc = Get.put(DeviceInfoController());
    NoticeController nc = Get.put(NoticeController());
    return GetBuilder<NoticeController>(
      builder: (_) =>
        Scaffold(
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
                                  NoticeMonthPicker(),
                                  for(NoticeListItem item in nc.noticeList)
                                    item.announcement ?
                                    NoticeItemAnnouncement(
                                      date: item.date,
                                      content: item.content,
                                      photo: item.photo,
                                      onPressed: () {
                                        nc.setNoticeDetail(item.noticeSeq);
                                        Navigator.push(context, MaterialPageRoute(builder:
                                            (context) => NoticeDetailPage()
                                        ));
                                      },
                                    ):
                                    NoticeItem(
                                      date: item.date,
                                      kids: item.kid.length == nc.kidList.length ? '@전체 원생' : (item.kid.length == 1 ? '@${item.kid[0]}' :'@${item.kid[0]} 외 ${item.kid.length - 1}명'),
                                      content: item.content,
                                      photo: item.photo,
                                      onPressed: () {
                                        nc.setNoticeDetail(item.noticeSeq);
                                        Navigator.push(context, MaterialPageRoute(builder:
                                            (context) => NoticeDetailPage()
                                        ));
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
                dc.isTeacher ?
                Positioned(
                    bottom: 20,
                    right: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>NoticeRegist()));
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
        ),
    );
  }
}