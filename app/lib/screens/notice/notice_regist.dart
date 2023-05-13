import 'dart:io';
import 'package:app/api/notice_service.dart';
import 'package:app/components/common/logout_app_bar.dart';
import 'package:app/components/notice/add_image_icon.dart';
import 'package:app/constants.dart';
import 'package:app/screens/notice/notice_ai.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Kid {
  final int kidSeq;
  final String name;
  final String photo;

  Kid(this.kidSeq, this.name, this.photo);
}

class NoticeRegist extends StatefulWidget {
  @override
  State<NoticeRegist> createState() => _NoticeRegistState();
}

TextEditingController _controller = TextEditingController();
bool isAnnouncement = false;
String content = '';
List<File> _images = [];
List<int> kidSeqs = [];
List<Kid> kids = [];

class _NoticeRegistState extends State<NoticeRegist> {

  @override
  void initState() {
    super.initState();
    setState(() {
      print('실행됨');
      kidSeqs.add(2);
      kids.add(Kid(1, '김나현', 'aseets/images/bonggil.jpg'));
      kids.add(Kid(2, '이연희', 'aseets/images/sleepingCat.png'));
      kids.add(Kid(3, '오하늘', 'aseets/images/bonggil.jpg'));
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: lightNavy,
      appBar: LogoutAppBar(),
      body: Row(
        children: [
          Expanded(child: SizedBox()),
          Flexible(
            flex: 12,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  Container(
                    height: 530,
                    margin: EdgeInsets.fromLTRB(0, 6.0, 0, 12.0),
                    padding: EdgeInsets.fromLTRB(16, 4, 16, 16),
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
                              child: OutlinedButton(onPressed: (){_openDialog(context, kids);},
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
                          padding: const EdgeInsets.only(top: 2, bottom: 8),
                          child: Divider(color: Color(0xffD5D5D5), height: 1, thickness: 1,),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 80,
                          child: GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 5,
                            childAspectRatio: 1,
                          ),
                            children: [
                              AddImageIcon(onTap: (){
                                if(_images.length == 3) {
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
                              for(int i=0; i<_images.length; i++)
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
                                      child: Image.file(_images[i], fit: BoxFit.cover,),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    child: InkWell(
                                      onTap: (){setState(() {
                                        List<File> newImages = List.from(_images);
                                        newImages.removeAt(i);
                                        _images = newImages;
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
                          child: Text('알림장 기능은 최대 3장까지 첨부 가능합니다.', style: TextStyle(color: Colors.grey, fontSize: 10),),
                        ),

                        //본문내용 시작
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: TextField(
                                  onChanged: (value){
                                    setState(() {
                                      content = value;
                                    });
                                  },
                                  style: TextStyle(
                                    fontSize: 12.0
                                  ),
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
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(right: 4),
                            height: 40,
                            child: ElevatedButton(onPressed: (){ Navigator.pop(context, false); },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xffA2A2A2)
                                ),
                                child: Text('취소하기')
                            )
                          )
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 4),
                            height: 40,
                            child: ElevatedButton(
                                onPressed: (){
                                  NoticeService.registNotice(1, isAnnouncement, content, kidSeqs, _images);
                                  Navigator.pop(context, true);
                                  },
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
              ),
            )
          ),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  // 이미지 업로드
  Future<void> uploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _images.add(File(pickedFile!.path));
    });
  }

  // 원아 선택 페이지
  void _openDialog(BuildContext context, List<Kid> kids) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
                width: 600,
                height: 400,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text('원아 선택', style: TextStyle(
                          fontSize: titleTextSize,
                          fontWeight: FontWeight.w700
                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: TextButton(
                        onPressed: (){
                          setState(() {
                            if(kidSeqs.length == kids.length) {
                              kidSeqs = [];
                            }else {
                              List<int> newList = kids.map((kid) {return kid.kidSeq;}).toList();
                              kidSeqs = newList;
                            }
                          });
                        },
                        style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all(Colors.white),
                            backgroundColor: MaterialStateProperty.all(Colors.white),
                            foregroundColor: MaterialStateProperty.all(textColor)
                        ),
                        child: Row(
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child:
                                kidSeqs.length == kids.length ?
                                Icon(Icons.check_box)
                                    :
                                Icon(Icons.check_box_outline_blank)
                            ),
                            Text('전체 선택')
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 20),
                      child: Divider(color: Colors.grey, height: 1, thickness: 1,),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            for(Kid kid in kids)
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    if(kidSeqs.contains(kid.kidSeq)){
                                      kidSeqs.remove(kid.kidSeq);
                                    }else{
                                      kidSeqs.add(kid.kidSeq);
                                    }
                                  });
                                },
                                child: Container(
                                  height: 70,
                                  padding: EdgeInsets.fromLTRB(40, 10, 50, 10),
                                  decoration: BoxDecoration(
                                      color: kidSeqs.contains(kid.kidSeq) ? Color(0x40D5D5D5) : null
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircleAvatar(
                                            radius: 200,
                                            backgroundImage: AssetImage(kid.photo)
                                        ),
                                      ),
                                      Text(kid.name, style: TextStyle(
                                          fontSize: contentTextSize,
                                          fontWeight: FontWeight.w400
                                      ),)
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
            ),
          );
        }
    );
  }
}