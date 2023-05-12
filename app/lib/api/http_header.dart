import 'package:app/controller/deviceInfo_controller.dart';
import 'package:get/get.dart';

DeviceInfoController c = Get.put(DeviceInfoController());
String token = c.token;

Map<String, String> postHeaders = {
  "Content-Type" : "application/json",
};

Map<String, String> authHeaders = {
  "Content-Type" : "application/json",
  "Authorization" : "Bearer $token",
};

Map<String, String> authGetHeaders = {
  "Authorization" : "Bearer $token",
};