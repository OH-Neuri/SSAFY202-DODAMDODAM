import 'package:app/components/common/logout_app_bar.dart';
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
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                    padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
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
                            Text('알림장 자동완성', style: TextStyle(
                              fontSize: subTitleTextSize,
                              fontWeight: FontWeight.w600
                              ),
                            ),
                            TextButton(
                              onPressed: (){
                                showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(40),
                                        topRight: Radius.circular(40)
                                      )
                                    ),
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Padding(
                                        padding: const EdgeInsets.all(50.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('작성하기 전', style: TextStyle(
                                              fontSize: contentTextSize,
                                              fontWeight: FontWeight.w800,
                                              color: logoNavy
                                            )),
                                            Text('키워드 작성하기', style: TextStyle(
                                              fontSize: titleTextSize,
                                              fontWeight: FontWeight.w700
                                            ),),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                                              child: Text('- 언제, 어디서, 무엇을 했는지(할 예정인지) 적어주세요.',
                                                style: TextStyle(
                                                  fontSize: buttonTextSize,
                                                  fontWeight: FontWeight.w500
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                              child: Text('- 키워드가 자세할수록 정확한 내용이 나옵니다.',
                                                style: TextStyle(
                                                  fontSize: buttonTextSize,
                                                  fontWeight: FontWeight.w500
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                              child: Text('- 키워드의 순서도 영향을 미칠 수 있습니다.',
                                                style: TextStyle(
                                                  fontSize: buttonTextSize,
                                                  fontWeight: FontWeight.w500
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 12, bottom: 16),
                                              child: Text('  (예시)', style: TextStyle(fontSize: contentTextSize),),
                                            ),
                                            SizedBox(
                                              width: double.infinity,
                                              child: Wrap(
                                                alignment: WrapAlignment.start,
                                                spacing: 6,
                                                runSpacing: 10,
                                                children: [
                                                  KeywordChip(text: '봄 소풍', onPressed: (){}),
                                                  KeywordChip(text: '준비물은 도시락', onPressed: (){}),
                                                  KeywordChip(text: '9시에 출발하고 16시에 도착 예정', onPressed: (){}),
                                                  KeywordChip(text: '소풍 장소는 서울숲', onPressed: (){}),
                                                  KeywordChip(text: '즐겁게 잘 놀다 옴', onPressed: (){}),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    }
                                );
                              },
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(Colors.white),
                                backgroundColor: MaterialStateProperty.all(Colors.white),
                                foregroundColor: MaterialStateProperty.all(Colors.grey)
                              ),
                              child: Icon(Icons.info_outline)
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  autofocus: true,
                                  focusNode: inputFocus,
                                  controller: keywordController,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  cursorColor: darkNavy,
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
                                  padding: EdgeInsets.all(10),
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
                                child: Icon(Icons.add)
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
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
                        )
                      ],
                    ),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 70),
                        backgroundColor: darkNavy
                      ),
                      child: Text('작성하기',style: TextStyle(fontSize: buttonTextSize),)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 14, 0, 30),
                  child: ElevatedButton(
                      onPressed: (){
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 70),
                        backgroundColor: Color(0xffA2A2A2)
                      ),
                      child: Text('취소하기',style: TextStyle(fontSize: buttonTextSize),)
                  ),
                ),
              ],
            )
          ),
          Expanded(child: SizedBox()),
        ],
      ),


    );
  }
}