import 'dart:io';
import 'package:app/components/common/logout_app_bar.dart';
import 'package:app/components/notice/add_image_icon.dart';
import 'package:app/constants.dart';
import 'package:app/screens/notice/notice_ai.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class NoticeRegist extends StatefulWidget {
  @override
  State<NoticeRegist> createState() => _NoticeRegistState();
}

TextEditingController _controller = TextEditingController();
bool isAnnouncement = false;
List<String> images = [];

final picker = ImagePicker();

Future<void> uploadImage() async {
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  final file = File(pickedFile!.path);
  print(file);
  // Firebase Storage에 파일 업로드
  // final storage = FirebaseStorage.instance;
  // print('여기까지222222!');
  // final ref = storage.ref().child('images/${file.path.split('/').last}');
  // print('여기까지33333!');
  // print(ref);
  // final uploadTask = ref.putFile(file);
  // print('여기까지444');
  //
  // final snapshot = await uploadTask.whenComplete((){});
  // // 업로드한 파일의 URL 얻기
  // final url = await snapshot.ref.getDownloadURL();
  // print(url);
  // // 얻은 URL을 이용하여 이미지 표시 등의 작업 수행
}
List<int> kidSeqs = [];

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end ,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context)=>NoticeAI()));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: logoNavy,
                              minimumSize: Size(100, 32),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)
                              )
                          ),
                          child: Text('알림장 자동완성', style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 12
                          ),)
                      ),
                    ),
                  ],
                ),
                Expanded(child: Container(
                  margin: EdgeInsets.fromLTRB(0, 6.0, 0, 20.0),
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
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
                            width: 130,
                            child: OutlinedButton(onPressed: (){},
                              style: OutlinedButton.styleFrom(
                                foregroundColor: textColor,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0)
                              ),
                              child: Text('@전체 아동', style: TextStyle(fontSize: 12),),
                            ),
                          )
                          :
                          SizedBox(
                            width: 130,
                            child: OutlinedButton(onPressed: (){Get.toNamed('notice/regist/kid', arguments: kidSeqs);},
                              style: OutlinedButton.styleFrom(
                                foregroundColor: textColor,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0)
                              ),
                              child: Text('원아 선택', style: TextStyle(fontSize: 12),),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Divider(color: Color(0xffD5D5D5), height: 1, thickness: 1,),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 90,
                        child: GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 5,
                          childAspectRatio: 1,
                        ),
                          children: [
                            AddImageIcon(onTap: (){
                              if(images.length == 3) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("사진은 3장까지 첨부할 수 있습니다."),
                                    backgroundColor: Color(0xABFF2F00),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              }else{
                                uploadImage();
                              }
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
                                    child: Image.asset(images[i], fit: BoxFit.cover,),
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
                                    fontWeight: FontWeight.w200,
                                  )
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: 50,
                          child: ElevatedButton(onPressed: (){Navigator.pop(context);},
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
                          child: ElevatedButton(
                              onPressed: (){},
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