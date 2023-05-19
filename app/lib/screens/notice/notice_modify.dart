import 'dart:io';

import 'package:app/api/notice_service.dart';
import 'package:app/components/common/custom_snackbar.dart';
import 'package:app/components/common/title_appBar.dart';
import 'package:app/components/notice/add_image_icon.dart';
import 'package:app/constants.dart';
import 'package:app/controller/notice_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class NoticeModify extends StatefulWidget {
  const NoticeModify({Key? key}) : super(key: key);

  @override
  State<NoticeModify> createState() => _NoticeModifyState();
}

TextEditingController _controller = TextEditingController();
List<String> _images = [];

class _NoticeModifyState extends State<NoticeModify> {
  @override
  void initState() {
    super.initState();
    _controller.text = NoticeController.to.noticeDetail.content;
    _images = NoticeController.to.noticeDetail.photo;
  }

  @override
  Widget build(BuildContext context) {
    NoticeController nc = Get.put(NoticeController());
    return GetBuilder<NoticeController>(
        builder: (_) => Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: lightNavy,
              appBar: TitleAppBar(
                title: '알림장 수정',
              ),
              body: Row(
                children: [
                  Expanded(child: SizedBox()),
                  Flexible(
                      flex: 12,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              height: 530,
                              margin: EdgeInsets.fromLTRB(0, 36.0, 0, 12.0),
                              padding: EdgeInsets.fromLTRB(16, 4, 16, 16),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                        style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStateProperty.all(
                                                    textColor),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.white),
                                            overlayColor:
                                                MaterialStateProperty.all(
                                                    Colors.white)),
                                        onPressed: () {},
                                        child: Row(
                                          children: [
                                            nc.noticeDetail.announcement
                                                ? Icon(Icons.check_box)
                                                : Icon(Icons
                                                    .check_box_outline_blank),
                                            Text('   중요 공지')
                                          ],
                                        ),
                                      ),
                                      nc.noticeDetail.announcement
                                          ? SizedBox(
                                              width: 130,
                                              child: OutlinedButton(
                                                onPressed: () {},
                                                style: OutlinedButton.styleFrom(
                                                    foregroundColor: textColor,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50)),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 14.0,
                                                            vertical: 10.0)),
                                                child: Text(
                                                  '@전체 아동',
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              ),
                                            )
                                          : SizedBox(
                                              width: 130,
                                              child: OutlinedButton(
                                                onPressed: () {},
                                                style: OutlinedButton.styleFrom(
                                                    foregroundColor: textColor,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50)),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 14.0,
                                                            vertical: 10.0)),
                                                child: Text(
                                                  '총 ${nc.noticeDetail.kid.length} 명',
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              ),
                                            )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 2, bottom: 8),
                                    child: Divider(
                                      color: Color(0xffD5D5D5),
                                      height: 1,
                                      thickness: 1,
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 80,
                                    child: GridView(
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4,
                                          crossAxisSpacing: 5,
                                          childAspectRatio: 1,
                                        ),
                                        children: [
                                          AddImageIcon(onTap: () {
                                            if (_images.length == 3) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                      "사진은 3장까지 첨부할 수 있습니다."),
                                                  backgroundColor:
                                                      Color(0xABFF2F00),
                                                  duration:
                                                      Duration(seconds: 2),
                                                ),
                                              );
                                            } else {
                                              uploadImage();
                                              // print('추가해야함..');
                                            }
                                          }),
                                          for (int i = 0;
                                              i < _images.length;
                                              i++)
                                            Stack(children: [
                                              Container(
                                                padding: EdgeInsets.all(4),
                                                alignment: Alignment.center,
                                                width: double.infinity,
                                                height: double.infinity,
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  child: Image.network(
                                                    _images[i],
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                  right: 0,
                                                  top: 0,
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        List<String> newImages =
                                                            List.from(_images);
                                                        newImages.removeAt(i);
                                                        _images = newImages;
                                                      });
                                                    },
                                                    child: Container(
                                                        width: 20,
                                                        height: 20,
                                                        decoration: BoxDecoration(
                                                            color: Colors.red,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        child: Center(
                                                            child: Text(
                                                          'X',
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              color:
                                                                  Colors.white),
                                                        ))),
                                                  ))
                                            ])
                                        ]),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: Text(
                                      '알림장 기능은 최대 3장까지 첨부 가능합니다.',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 10),
                                    ),
                                  ),

                                  //본문내용 시작
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            style: TextStyle(fontSize: 12.0),
                                            controller: _controller,
                                            keyboardType:
                                                TextInputType.multiline,
                                            maxLines: null,
                                            minLines: 40,
                                            textInputAction:
                                                TextInputAction.newline,
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.grey)),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.grey)),
                                                hintText: '내용을 입력해주세요.',
                                                hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w200,
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                          padding: EdgeInsets.only(right: 4),
                                          height: 40,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  _images.clear();
                                                });
                                                _controller.clear();
                                                nc.setSelectKidClear();
                                                Navigator.pop(context);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Color(0xffA2A2A2),
                                                  foregroundColor:
                                                      Colors.white),
                                              child: Text('취소하기')))),
                                  Expanded(
                                      child: Container(
                                          padding: EdgeInsets.only(left: 4),
                                          height: 40,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                if (_controller.value.text ==
                                                    '') {
                                                  CustomSnackBar.errorSnackbar(
                                                      context, '내용을 입력해주세요');
                                                  return;
                                                }
                                                NoticeService.modifyNotice(
                                                    nc.noticeDetail.noticeSeq,
                                                    _controller.value.text,
                                                    _images);
                                                setState(() {
                                                  _images.clear();
                                                });
                                                _controller.clear();
                                                Navigator.pop(context);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: darkNavy,
                                                  foregroundColor:
                                                      Colors.white),
                                              child: Text('수정하기')))),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                  Expanded(child: SizedBox()),
                ],
              ),
            ));
  }

  // 이미지 수정...과정..
  Future<void> uploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    File file = File(pickedFile!.path);
    String imageUrl = await NoticeService.imageToUrl(file);
    setState(() {
      _images.add(imageUrl);
    });
  }
}
