import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/screens/attendance/attendance_detail_parent.dart';
import 'package:app/screens/attendance/attendance_list.dart';
import 'package:app/screens/medicine/medicine_parent_page.dart';
import 'package:app/screens/medicine/medicine_teacher_page.dart';
import 'package:flutter/material.dart';
import 'package:app/screens/notice/notice_list.dart';
import 'package:get/get.dart';

class MainIconButton extends StatefulWidget {
  final String title;
  const MainIconButton({super.key, required this.title});

  @override
  State<MainIconButton> createState() => _MainIconButtonState();
}

class _MainIconButtonState extends State<MainIconButton> {
  bool isTeacher = false;
  DeviceInfoController c = Get.put(DeviceInfoController());

  @override
  void initState() {
    super.initState();
    isTeacher = c.isTeacher;
  }
  @override
  Widget build(BuildContext context) {
    Widget icon;
    dynamic link;
    switch (widget.title) {
      case '알림장':
        icon = Image.asset('assets/images/common/notebook_icon.png');
        link = NoticeList();
        break;
      case '등하원 확인서':
        icon = Image.asset('assets/images/common/goback_icon.png');
        // 선생님이면?
        if (isTeacher) {
          link = AttendanceList();
        }
        // 부모면?
        else {
          link = AttendanceDetailParent();
        }
        break;
      case '투약 의뢰서':
        icon = Image.asset('assets/images/common/medicine_icon.png');
        // 선생님이면?
        if (isTeacher) {
          link = MedicineTeacherPage();
        }
        // 부모면?
        else {
          link = MedicineParentPage();
        }
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
        margin: EdgeInsets.symmetric(horizontal: 10),
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
              child: Text(widget.title),
            ),
          ],
        ),
      ),
    );
  }
}
