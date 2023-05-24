import 'dart:io';
import 'package:app/api/notice_service.dart';
import 'package:app/components/common/custom_snackbar.dart';
import 'package:app/components/common/title_appBar.dart';
import 'package:app/components/notice/add_image_icon.dart';
import 'package:app/components/notice/select_kid_modal.dart';
import 'package:app/constants.dart';
import 'package:app/controller/notice_controller.dart';
import 'package:app/screens/notice/notice_ai.dart';
import 'package:app/screens/notice/notice_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class NoticeRegist extends StatefulWidget {
  @override
  State<NoticeRegist> createState() => _NoticeRegistState();
}

TextEditingController _controller = TextEditingController();
bool isAnnouncement = false;
List<File> _images = [];

class _NoticeRegistState extends State<NoticeRegist> {
  @override
  void initState() {
    super.initState();
    if(NoticeController.to.aiNotice != '') {
      _controller.text = NoticeController.to.aiNotice;
    }
  }

  @override
  Widget build(BuildContext context) {
    NoticeController nc = Get.put(NoticeController());
    return GetBuilder<NoticeController>(builder: (_)=>
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: lightNavy,
          appBar: TitleAppBar(title: '알림장 작성',),
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
                                  onPressed: () async {
                                    bool res = await showDialog(context: context, builder: (context)=>
                                        AlertDialog(
                                          contentPadding: EdgeInsets.symmetric(vertical: 40, horizontal: 18),
                                          content: SizedBox(
                                            height: 200,
                                            width: 300,
                                            child: Column(
                                              children: [
                                                Text('알림장 자동완성 이용시'),
                                                Container(
                                                    decoration: BoxDecoration(
                                                        border: Border(bottom: BorderSide(color: Colors.grey))
                                                    ),
                                                    child: Text('작성중이던 글이 사라지게 됩니다.',)),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 16.0, bottom: 28.0),
                                                  child: Text('계속 이용하시겠습니까?'),
                                                ),
                                                ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        backgroundColor: darkNavy,
                                                        minimumSize: Size(double.infinity, 50)
                                                    ),
                                                    onPressed: (){
                                                      Navigator.pop(context, true);
                                                    },
                                                    child: Text('계속하기', style: TextStyle(color: Colors.white, fontSize: 16),)),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 20.0),
                                                  child: InkWell(
                                                    onTap: (){Navigator.pop(context, false);},
                                                    child: Text('취소', style: TextStyle(fontWeight: FontWeight.w600),),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                    );
                                    if(res) {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NoticeAI()));
                                    }
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
                                      color: Colors.white,
                                      fontSize: 12
                                  ),)
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 520,
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
                                    child: OutlinedButton(onPressed: (){_openDialog(context);},
                                      style: OutlinedButton.styleFrom(
                                          foregroundColor: textColor,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                          padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0)
                                      ),
                                      child: Text(
                                        nc.selectKids.isEmpty ?
                                        '원아 선택' :
                                        '총 ${nc.selectKids.length} 명',
                                        style: TextStyle(fontSize: 12),),
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
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                      padding: EdgeInsets.only(right: 4),
                                      height: 40,
                                      child: ElevatedButton(onPressed: (){
                                        setState(() {
                                          isAnnouncement = false;
                                          _images.clear();
                                        });
                                        _controller.clear();
                                        nc.setSelectKidClear();
                                        Navigator.pop(context);
                                      },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Color(0xffA2A2A2),
                                              foregroundColor: Colors.white
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
                                            if(!isAnnouncement && nc.selectKids.isEmpty){
                                              CustomSnackBar.errorSnackbar(context, '원생을 선택해주세요.');
                                              return;
                                            }else if(_controller.value.text.trim() == '') {
                                              CustomSnackBar.errorSnackbar(context, '내용을 입력해주세요.');
                                              return;
                                            }
                                            if(isAnnouncement) {
                                              List<int> kidSeqs = nc.kidList.map((kid) => kid.kidSeq).toList();
                                              print(kidSeqs);
                                              NoticeService.registNotice(1, isAnnouncement, _controller.value.text, kidSeqs, _images);
                                            }else{
                                              NoticeService.registNotice(1, isAnnouncement, _controller.value.text, nc.selectKids, _images);
                                            }
                                            setState(() {
                                              isAnnouncement = false;
                                              _images.clear();
                                            });
                                            _controller.clear();
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>NoticeList()));
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: darkNavy,
                                              foregroundColor: Colors.white
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
        )
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
  void _openDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SelectKidModal();
        }
    );
  }
}