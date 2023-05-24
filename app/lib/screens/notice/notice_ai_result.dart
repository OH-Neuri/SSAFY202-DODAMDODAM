import 'package:app/constants.dart';
import 'package:app/controller/notice_controller.dart';
import 'package:app/screens/notice/notice_regist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoticeAIResult extends StatelessWidget {
  final List<String> keywords;
  const NoticeAIResult({super.key, required this.keywords});

  @override
  Widget build(BuildContext context) {
    NoticeController nc = Get.put(NoticeController());
    return GetBuilder<NoticeController>(builder: (_)=>
        Scaffold(
            backgroundColor: Colors.white,
            body: nc.isLoading
                ? NoticeLoading()
                : SizedBox(
              width: double.infinity,
              child: Container(
                height: double.infinity,
                color: lightNavy,
                padding: EdgeInsets.fromLTRB(24, 80, 24, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Column(
                            children: [
                              Wrap(
                                spacing: 10,
                                children: [
                                  for(String keyword in keywords)
                                    Text(keyword, style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        decorationColor: Color(0x80FCD311),
                                        decorationThickness: 5
                                    ),),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Text('키워드를 사용해 자동 완성된 알림장입니다.'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 14.0, bottom: 10),
                                child: Divider(color: Colors.grey, thickness: 1, height: 1,),
                              ),
                              Expanded(child: SingleChildScrollView(child: Text(nc.aiNotice)))
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: darkNavy,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              minimumSize: Size(double.infinity, 50)
                          ),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>NoticeRegist(),));
                          },
                          child: Text('작성창에 반영하기')),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffA5A5A5),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              minimumSize: Size(double.infinity, 50)
                          ),
                          onPressed: (){
                            nc.setAiNoticeClear();
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: Text('취소하고 돌아가기')),
                    ),
                  ],
                ),
              ),
            )
        )
    );
  }
}

class NoticeLoading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/notice/작성중.gif'),
          Text("작성하신 키워드들로", style: TextStyle(
              color: Colors.grey[800],
              fontSize: 18,
              fontWeight: FontWeight.w600
          ),),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text("알림장을 작성중입니다", style: TextStyle(
                color: Colors.grey[800],
                fontSize: 18,
                fontWeight: FontWeight.w600
            ),),
          ),
          // ElevatedButton(
          //     onPressed: (){
          //       nc.setIsLoading(false);
          //     },
          //     child: Text('클릭'))
        ],
      ),
    );
  }
}
