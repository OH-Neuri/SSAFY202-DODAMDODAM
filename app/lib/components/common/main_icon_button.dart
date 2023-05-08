import 'package:app/screens/notice/notice_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainIconButton extends StatelessWidget {
  final String title;
  const MainIconButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    Widget icon;
    dynamic link;
    switch (title) {
      case '알림장':
        icon = Image.asset('/images/common/notebook_icon.png');
        link = NoticeList();
        break;
      case '등하원 확인서':
        icon = Image.asset('/images/common/goback_icon.png');
        link = NoticeList();
        break;
      case '투약 의뢰서':
        icon = Image.asset('/images/common/medicine_icon.png');
        link = NoticeList();
        break;
      default:
        icon = Container();
        link = NoticeList();
    }
    return InkWell(
      onTap: (){
        // bottomNavi를 살리기 위해 Navigator 사용
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => link));
        // Get.toNamed(link);
      },
      child: Container(
        height: 100, width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 5.0,
                offset: Offset(0, 10),
              ),
            ],
          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 50, height: 50,
              child: icon
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Text(title),
            ),
          ],
        ),
      ),
    );
  }
}
