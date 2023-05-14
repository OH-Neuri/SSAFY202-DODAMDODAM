import 'package:app/controller/notice_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoticeAIResult extends StatelessWidget {
  const NoticeAIResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NoticeController nc = Get.put(NoticeController());
    return GetBuilder<NoticeController>(builder: (_)=>
      Scaffold(
        backgroundColor: Colors.white,
        body: !nc.isLoading
          ? NoticeLoading()
          : SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('자동 완성된 알림장입니다.'),
                ElevatedButton(
                    onPressed: (){},
                    child: Text('작성창에 반영하기')),
                ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Text('취소하고 돌아가기')),
              ],
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
            fontSize: 18,
            fontWeight: FontWeight.w600
          ),),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text("알림장을 작성중입니다", style: TextStyle(
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
