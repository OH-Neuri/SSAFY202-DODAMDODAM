import 'package:app/api/schedule_service.dart';
import 'package:app/models/schedule/singleday_schedule_model.dart';
import 'package:app/utils/convert_dayToWeek.dart';
import 'package:get/get.dart';

class TodayController extends GetxController {
  static TodayController get to => Get.find();
  // 달력에서 여러 날의 일정
  List<OneSchedule> scheduleList = <OneSchedule>[];
  // 당일의 일정
  List<OneSchedule> todayScheduleList = <OneSchedule>[];
  // 오늘 날짜
  DateTime now = DateTime.now();
  String todayWeek = getDayOfWeek(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  // 선택한 날짜
  DateTime choiceDay = DateTime.now();
  String dayWeek = getDayOfWeek(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  @override
  void onInit() async {
    now = DateTime.now();
    choiceDay = DateTime.now();
    todayWeek = getDayOfWeek(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    dayWeek = getDayOfWeek(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    todayScheduleList = await ScheduleService.getOneDayScheduleList(now.year, now.month, now.day);
    scheduleList = todayScheduleList;
    super.onInit();
    update();
  }

  // 일정 날짜 변경 시?
  void setOneDayInfo(DateTime date) async {
    choiceDay = date;
    dayWeek = getDayOfWeek(choiceDay.year, choiceDay.month, choiceDay.day);
    try {
      scheduleList = await ScheduleService.getOneDayScheduleList(choiceDay.year, choiceDay.month, choiceDay.day);
    } catch (e) {
      print(e);
    }
    update();
  }
}