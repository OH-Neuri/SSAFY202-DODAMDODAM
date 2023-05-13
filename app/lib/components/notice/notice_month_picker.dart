import 'package:app/constants.dart';
import 'package:app/controller/notice_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class NoticeMonthPicker extends StatelessWidget {
  NoticeController nc = Get.put(NoticeController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              showMonthPicker(
                context: context,
                headerColor: darkNavy,
                unselectedMonthTextColor: textColor,
                selectedMonthBackgroundColor: darkNavy,
                dismissible: true,
                roundedCornersRadius: 20,
                locale: const Locale('KO'),
                confirmWidget: Text('선택', style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: logoNavy,
                ),),
                cancelWidget: Text('닫기', style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey
                ),),
                initialDate: DateTime.now(),
              ).then((DateTime? date) {
                if (date != null) {
                  nc.setSelectedYear(date.year);
                  nc.setSelectedMonth(date.month);
                  nc.setNoticeList();
                }
              });
            },
            child: SizedBox(
              width: 140,
              height: 36,
              child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color(0x80FFFFFF),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: nc.selectedYear == 0
                      ? Text('전체 날짜')
                      : Text('${nc.selectedYear}년 ${nc.selectedMonth}월')
              ),
            ),
          ),
        ],
      ),
    );
  }
}