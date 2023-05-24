import 'package:app/controller/deviceInfo_controller.dart';
import 'package:get/get.dart';

DeviceInfoController c = Get.put(DeviceInfoController());

Map<String, String> postHeaders = {
  "Content-Type" : "application/json",
};

Map<String, String> authPostHeaders = {
  "Content-Type" : "application/json",
  "Authorization" : "Bearer ${c.token}",
};

Map<String, String> authGetHeaders = {
  "Authorization" : "Bearer ${c.token}",
};