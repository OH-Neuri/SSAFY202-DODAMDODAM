import 'package:app/components/common/logout_app_bar.dart';
import 'package:app/components/notice/ai_guide_modal.dart';
import 'package:app/components/notice/keyword_chip.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoticeAI extends StatefulWidget {
  const NoticeAI({Key? key}) : super(key: key);

  @override
  State<NoticeAI> createState() => _NoticeAIState();
}

List<String> keyword = [];
bool result = false;
final keywordController = TextEditingController();
FocusNode inputFocus = FocusNode();

class _NoticeAIState extends State<NoticeAI> {
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 460,
                    margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Text('알림장 자동완성', style: TextStyle(
                                fontSize: subTitleTextSize,
                                fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(40),
                                        topRight: Radius.circular(40)
                                      )
                                    ),
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AIGuideModal();
                                    }
                                );
                              },
                              overlayColor: MaterialStateProperty.all(Colors.white),
                              child: Icon(Icons.info_outline, color: Colors.grey,),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  autofocus: true,
                                  focusNode: inputFocus,
                                  maxLength: 20,
                                  controller: keywordController,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  cursorColor: darkNavy,
                                  style: TextStyle(
                                    fontSize: 12.0
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                                    hintText: '키워드를 입력하세요',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w200
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey)
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: darkNavy)
                                    ),

                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: darkNavy,
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.all(4),
                                  shape: CircleBorder(
                                    eccentricity: 0
                                  )
                                ),
                                onPressed: (){
                                  setState(() {
                                    if(keywordController.text != '') {
                                      keyword.add(keywordController.text);
                                    }
                                    keywordController.text = '';
                                    inputFocus.requestFocus();
                                  });
                                },
                                child: Icon(Icons.add, size: 18,)
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: double.infinity,
                            // height: 200,
                            child: SingleChildScrollView(
                              child: Wrap(
                                alignment: WrapAlignment.start,
                                spacing: 6,
                                runSpacing: 10,
                                children: [
                                  for(int i=0; i<keyword.length; i++)
                                    KeywordChip(text: keyword[i], onPressed: (){
                                      setState(() {
                                        keyword.removeAt(i);
                                      });
                                    })
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                    child: ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          backgroundColor: darkNavy
                        ),
                        child: Text('작성하기',style: TextStyle(fontSize: contentTextSize),)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 14, 0, 30),
                    child: ElevatedButton(
                        onPressed: (){
                          setState(() {
                            keyword.clear();
                          });
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          backgroundColor: Color(0xffA2A2A2)
                        ),
                        child: Text('취소하기',style: TextStyle(fontSize: contentTextSize),)
                    ),
                  ),
                ],
              ),
            )
          ),
          Expanded(child: SizedBox()),
        ],
      ),


    );
  }
}

