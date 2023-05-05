import 'package:app/components/common/logout_app_bar.dart';
import 'package:app/components/common/toast.dart';
import 'package:app/components/notice/add_image_icon.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoticeRegist extends StatefulWidget {
  const NoticeRegist({Key? key}) : super(key: key);

  @override
  State<NoticeRegist> createState() => _NoticeRegistState();
}

TextEditingController _controller = TextEditingController();
bool isAnnouncement = false;
List<String> images = ['1', '2', '4'];

class _NoticeRegistState extends State<NoticeRegist> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: lightNavy,
      appBar: LogoutAppBar(),
      body: Row(
        children: [
          Expanded(child: SizedBox()),
          Flexible(
            flex: 12,
            child: Column(
              children: [
                Expanded(child: Container(
                  margin: EdgeInsets.fromLTRB(0, 40.0, 0, 20.0),
                  padding: EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all(textColor),
                              backgroundColor: MaterialStateProperty.all(Colors.white),
                              overlayColor: MaterialStateProperty.all(Colors.white)
                            ),
                            onPressed: (){setState(() {
                              isAnnouncement = !isAnnouncement;
                            });},
                            child: Row(
                              children: [
                                isAnnouncement ?
                                Icon(Icons.check_box)
                                :
                                Icon(Icons.check_box_outline_blank),
                                Text('   중요 공지')
                              ],
                            ),
                          ),
                          isAnnouncement ?
                          SizedBox(
                            width: 160,
                            child: OutlinedButton(onPressed: (){},
                              style: OutlinedButton.styleFrom(
                                foregroundColor: textColor,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)
                              ),
                              child: Text('@전체 아동'),
                            ),
                          )
                          :
                          SizedBox(
                            width: 160,
                            child: OutlinedButton(onPressed: (){print('원아선택');},
                              style: OutlinedButton.styleFrom(
                                foregroundColor: textColor,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)
                              ),
                              child: Text('원아 선택'),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Divider(color: Color(0xffD5D5D5), height: 1, thickness: 1,),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 100,
                        child: GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 5,
                          childAspectRatio: 1,
                        ),
                          children: [
                            AddImageIcon(onTap: (){
                              ToastClass.showToast('사진은 3장까지 첨부할 수 있습니다.');
                            }),
                            for(int i=0; i<images.length; i++)
                            Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(4),
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: Image.asset('images/bonggil.jpg', fit: BoxFit.cover,),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: InkWell(
                                    onTap: (){setState(() {
                                      List<String> newImages = List.from(images);
                                      newImages.removeAt(i);
                                      images = newImages;
                                    });},
                                    child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Center(child: Text('X', style: TextStyle(fontSize: 10, color: Colors.white),))
                                    ),
                                  )
                                )
                              ]
                            )
                          ]
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Text('알림장 기능은 최대 3장까지 첨부 가능합니다.', style: TextStyle(color: Colors.grey, fontSize: 12),),
                      ),

                      //본문내용 시작
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _controller,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                minLines: 40,
                                textInputAction: TextInputAction.newline,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: Colors.grey)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(color: Colors.grey)
                                  ),
                                  hintText: '내용을 입력해주세요.',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w200
                                  )
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                                  child: ElevatedButton(onPressed: (){},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: logoNavy,
                                        minimumSize: Size(140, 40)
                                      ),
                                      child: Text('맞춤법 검사', style: TextStyle(
                                        fontWeight: FontWeight.w300
                                      ),)
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: ElevatedButton(onPressed: (){},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: logoNavy,
                                        minimumSize: Size(140, 40)
                                      ),
                                      child: Text('알림장 자동완성', style: TextStyle(
                                        fontWeight: FontWeight.w300
                                      ),)
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: 50,
                          child: ElevatedButton(onPressed: (){Get.back();},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffA2A2A2)
                              ),
                              child: Text('취소하기')
                          )
                        )
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: 50,
                          child: ElevatedButton(onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: darkNavy
                              ),
                              child: Text('등록하기')
                          )
                        )
                      ),
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
}