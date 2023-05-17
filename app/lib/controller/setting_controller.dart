import 'package:app/api/setting_service.dart';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/models/code/add_class_model.dart';
import 'package:app/models/code/add_kid_model.dart';
import 'package:app/models/setting/sleep_mode_time_model.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  static SettingController get to => Get.find();

  List<AddClass> classList = <AddClass>[];
  List<AddKid> kidList = <AddKid>[];
  SleepModeTime sleepModeTime = SleepModeTime(sleepModeStart: '', sleepModeEnd: '');

  @override
  void onInit() {
    if(DeviceInfoController.to.isTeacher){
      setClassList();
      setSleepTimeMode();
    }else{
      setKidList();
    }
    update();
    super.onInit();
  }

  void setClassList() async {
    classList = await SettingService.getClassList();
    update();
  }

  void setKidList() async {
    kidList = await SettingService.getKidList();
    update();
  }

  void setClassListClear() {
    classList = [];
    update();
  }

  void setKidListClear() {
    kidList = [];
    update();
  }

  void setSleepTimeMode() async {
    sleepModeTime = await SettingService.getSleepModeTime();
    update();
  }

}