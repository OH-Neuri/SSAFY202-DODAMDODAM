import 'package:app/api/schedule_service.dart';
import 'package:app/models/schedule/schedule_type_model.dart';
import 'package:get/get.dart';

class CalendarTypeController extends GetxController {
  static CalendarTypeController get to => Get.find();

  List<SingleType> typeList = <SingleType>[];

  @override
  void onInit() {
    setTypeList();
    super.onInit();
  }

  void setTypeList() async {
    try {
      typeList = await ScheduleService.getTypeList();
    } catch (e) {
      print(e);
    }
    update();
  }
}