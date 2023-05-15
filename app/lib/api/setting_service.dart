import 'dart:convert';
import 'package:app/api/http_header.dart';
import 'package:app/api/url_mapping.dart';
import 'package:app/models/code/add_class_model.dart';
import 'package:app/models/code/add_kid_model.dart';
import 'package:app/models/setting/class_list_model.dart';
import 'package:app/models/setting/kid_list_model.dart';
import 'package:http/http.dart' as http;

class SettingService {
  static Future<List<AddClass>> getClassList() async {
    try {
      String URL = '${url}/user/class';
      final res = await http.get(
          Uri.parse(URL),
          headers: authGetHeaders
      );
      if(res.statusCode == 200) {
        List<AddClass> classList = classListModelFromJson(utf8.decode(res.bodyBytes)).classList;
        return classList;
      }else{
        return [];
      }
    } catch(e) {
      print(e);
      return [];
    }
  }

  static Future<List<AddKid>> getKidList() async {
    try {
      String URL = '${url}user/kid';
      final res = await http.get(
        Uri.parse(URL),
        headers: authGetHeaders
      );
      if(res.statusCode == 200) {
        List<AddKid> kidList = kidListModelFromJson(utf8.decode(res.bodyBytes)).kidList;
        return kidList;
      }else{
        return [];
      }
    } catch(e) {
      print(e);
      return [];
    }
  }
}