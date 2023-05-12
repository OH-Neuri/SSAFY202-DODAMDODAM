import 'package:app/components/common/logout_app_bar.dart';
import 'package:app/components/notice/notice_item.dart';
import 'package:app/components/notice/notice_item_announcement.dart';
import 'package:app/constants.dart';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/controller/notice_controller.dart';
import 'package:app/screens/notice/notice_detail.dart';
import 'package:app/screens/notice/notice_regist.dart';
import 'package:flutter/material.dart';
import 'package:app/models/notice/notice_list_model.dart';
import 'package:get/get.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

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
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: (){
                                            showMonthPicker(
                                              context: context,
                                              headerColor: darkNavy,
                                              unselectedMonthTextColor: textColor,
                                              selectedMonthBackgroundColor: mainPink,
                                              dismissible: true,
                                              roundedCornersRadius: 20,
                                              locale: const Locale('KO'),
                                              confirmWidget: Text('선택', style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: logoNavy,
                                              ),),
                                              cancelWidget: Text('닫기', style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.grey
                                              ),),
                                              initialDate: DateTime.now(),
                                            ).then((DateTime? date) {
                                              if (date != null) {
                                                nc.setSelectedYear(date.year);
                                                nc.setSelectedMonth(date.month);
                                                nc.setNoticeList();
                                              }
                                            });
                                          },
                                          child: SizedBox(
                                            width: 140,
                                            height: 36,
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: Color(0x80FFFFFF),
                                                borderRadius: BorderRadius.circular(10)
                                              ),
                                              child: nc.selectedYear == 0 
                                                  ? Text('전체 날짜')
                                                  : Text('${nc.selectedYear}년 ${nc.selectedMonth}월')
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  for(NoticeListItem item in nc.noticeList)
                                    item.announcement ?
                                    NoticeItemAnnouncement(
                                      date: item.date,
                                      content: item.content,
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder:
                                            (context) => NoticeDetailPage(noticeSeq : item.noticeSeq)
                                        ));
                                      },
                                    ):
                                    NoticeItem(
                                      date: item.date,
                                      kids: item.kid.length == nc.kidList.length ? '@전체 원생' : (item.kid.length == 1 ? '@${item.kid[0]}' :'@${item.kid[0]} 외 ${item.kid.length - 1}명'),
                                      content: item.content,
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder:
                                            (context) => NoticeDetailPage(noticeSeq : item.noticeSeq)
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