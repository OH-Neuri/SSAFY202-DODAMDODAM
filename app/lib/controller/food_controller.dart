import 'package:app/api/food_service.dart';
import 'package:app/models/schedule/singleday_food_model.dart';
import 'package:app/utils/convert_dayToWeek.dart';
import 'package:get/get.dart';

class FoodController extends GetxController {
  static FoodController get to => Get.find();
  // 달력에서 여러 날의 급식
  OneDayFood food = OneDayFood(foodSeq: 1, rice: null, soup: null, dish1: null, dish2: null, dish3: null, morningSnack1: null, morningSnack2: null, afternoonSnack1: null, afternoonSnack2: null);
  // 당일의 급식
  OneDayFood todayFood = OneDayFood(foodSeq: 1, rice: null, soup: null, dish1: null, dish2: null, dish3: null, morningSnack1: null, morningSnack2: null, afternoonSnack1: null, afternoonSnack2: null);
  // 오늘 날짜
  DateTime now = DateTime.now();
  String todayWeek = '';
  // 선택한 날짜
  DateTime choiceDay = DateTime.now();
  String dayWeek = '';

  @override
  void onInit() async {
    now = DateTime.now();
    choiceDay = DateTime.now();
    food = await FoodService.getOneDayFood(now.year, now.month, now.day);
    todayFood = food;
    todayWeek = getDayOfWeek(now.year, now.month, now.day);
    dayWeek = todayWeek;
    super.onInit();
    update();
  }

  // 급식 날짜 변경 시?
  void setOneDayFood(DateTime date) async {
    choiceDay = date;
    dayWeek = getDayOfWeek(choiceDay.year, choiceDay.month, choiceDay.day);
    try {
      food = await FoodService.getOneDayFood(choiceDay.year, choiceDay.month, choiceDay.day);
    } catch (e) {
      print(e);
    }
    update();
  }

}