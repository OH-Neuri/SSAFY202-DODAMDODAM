import 'package:app/api/notice_service.dart';
import 'package:app/components/common/check_delete_modal.dart';
import 'package:app/components/common/logout_app_bar.dart';
import 'package:app/constants.dart';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/controller/notice_controller.dart';
import 'package:app/screens/notice/notice_image_detail.dart';
import 'package:app/utils/kid_lenght_to_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoticeDetailPage extends StatelessWidget {
  const NoticeDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceInfoController dc = Get.put(DeviceInfoController());
    NoticeController nc = Get.put(NoticeController());
    return GetBuilder<NoticeController>(
        builder: (_) =>
          Scaffold(
            backgroundColor: lightNavy,
            appBar: LogoutAppBar(),
            body: Row(
              children: [
                Expanded(child: SizedBox()),
                Flexible(flex: 12,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 6, 2, 6),
                            child: dc.isTeacher ?
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: (){},
                                  overlayColor: MaterialStateProperty.all(darkNavy),
                                  borderRadius: BorderRadius.circular(50),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.create_outlined, color: logoNavy,),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    checkDelete(context, (){
                                      NoticeService.deleteNotice(nc.noticeDetail.noticeSeq);
                                      nc.setNoticeList();
                                      Navigator.pop(context);
                                    });
                                  },
                                  overlayColor: MaterialStateProperty.all(darkNavy),
                                  borderRadius: BorderRadius.circular(50),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.delete_outlined, color: logoNavy,),
                                  ),
                                ),
                              ],
                            )
                            : SizedBox()
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(24),
                            margin: EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(nc.noticeDetail.date),
                                    nc.noticeDetail.announcement ?
                                    Text('전체 공지', style: TextStyle(fontWeight: FontWeight.w600),) :
                                    Text(
                                      kidLengthToText(nc.noticeDetail.kid),
                                      style: TextStyle(color: Colors.grey),)
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10, bottom: 20),
                                  child: Divider(color: Colors.grey, height: 1, thickness: 1),
                                ),
                                nc.noticeDetail.photo.isEmpty
                                ? SizedBox()
                                : SizedBox(
                                  width: double.infinity,
                                  height: 120,
                                  child: GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 5,
                                  ),
                                    children: [
                                      for(int i=0; i<nc.noticeDetail.photo.length; i++)
                                        InkWell(
                                            onTap: (){Navigator.push(context, MaterialPageRoute(
                                                builder: (context)=> NoticeImageDetail(images: nc.noticeDetail.photo, index: i)
                                            )
                                            );},
                                            child: Image.network(nc.noticeDetail.photo[i], fit: BoxFit.cover,)
                                        ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Text(nc.noticeDetail.content),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                ),
                Expanded(child: SizedBox()),
              ],
            ),
          )
     );
  }
}