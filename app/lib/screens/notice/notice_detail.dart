import 'package:app/api/notice_service.dart';
import 'package:app/components/common/check_delete_modal.dart';
import 'package:app/components/common/logout_app_bar.dart';
import 'package:app/constants.dart';
import 'package:app/models/notice/notice_detail_model.dart';
import 'package:app/screens/notice/notice_image_detail.dart';
import 'package:flutter/material.dart';

class NoticeDetailPage extends StatefulWidget {
  const NoticeDetailPage({Key? key, required this.noticeSeq}) : super(key: key);
  final int noticeSeq;

  @override
  State<NoticeDetailPage> createState() => _NoticeDetailPageState();
}

class _NoticeDetailPageState extends State<NoticeDetailPage> {
  NoticeDetail _noticeDetail = NoticeDetail(noticeSeq: 0, date: '', content: '', announcement: true, photo: [], kid: []);

  @override
  void initState() {
    super.initState();
    NoticeService.getNoticeDetail(widget.noticeSeq).then((value) =>
      setState((){
        _noticeDetail = value;
      })
    );
  }
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 6, 2, 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(onPressed: (){},
                            style: TextButton.styleFrom(
                              shape: CircleBorder(),
                              foregroundColor: logoNavy,
                            ),
                            child: Icon(Icons.create_outlined)),
                        TextButton(
                            onPressed: (){
                              checkDelete(context, deleteNoticeAfterCheck);
                            },
                            style: TextButton.styleFrom(
                              shape: CircleBorder(),
                              foregroundColor: logoNavy,
                            ),
                            child: Icon(Icons.delete_outlined)),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_noticeDetail.date),
                            _noticeDetail.announcement ?
                              Text('전체 공지', style: TextStyle(fontWeight: FontWeight.w600),) :
                              Text('@전체 원생', style: TextStyle(color: Colors.grey),)
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Divider(color: Colors.grey, height: 1, thickness: 1),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 120,
                          child: GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 5,
                          ),
                            children: [
                              for(int i=0; i<_noticeDetail.photo.length; i++)
                              InkWell(
                                onTap: (){Navigator.push(context, MaterialPageRoute(
                                    builder: (context)=> NoticeImageDetail(images: _noticeDetail.photo, index: i)
                                  )
                                );},
                                child: Image.network(_noticeDetail.photo[i], fit: BoxFit.cover,)
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
                          child: Text(_noticeDetail.content),
                        )
                      ],
                    ),
                  )
                ],
              )
          ),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }
  void deleteNoticeAfterCheck() {
      NoticeService.deleteNotice(widget.noticeSeq);
      Navigator.pop(context, true);
  }
}