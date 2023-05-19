import 'dart:convert';
import 'package:app/api/http_header.dart';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/models/chatting/chatting_teacher_list_model.dart';
import 'package:app/models/chatting/chatting_user_list_model.dart';
import 'package:http/http.dart' as http;
import 'package:app/api/url_mapping.dart';

class ChattingService {
  // 친구목록 - 선생님에게 보여줄 학부모들
  static Future<List<SingleUser>> getChatUserList() async{
    String URL = '${url}chat/parent/${DeviceInfoController.to.classSeq}';
    try{
      final response = await http.get(Uri.parse(URL), headers: authGetHeaders);
      if(response.statusCode == 200){
        final List<SingleUser> userList = chattingUserListFromJson(utf8.decode(response.bodyBytes)).userList;
        return userList;
      }else {
        print('$URL 선생님:학부모들 Error 발생 ');
        return <SingleUser>[];
      }
    }catch(e){
      print(e);
      return <SingleUser>[];
    }
  }

  // 친구목록 - 학부모에게 보여줄 선생님들
  static Future<List<SingleTeacher>> getChatTeacherList() async {
    String URL = '${url}chat/teacher/${DeviceInfoController.to.kidSeq}';
    try{
      final response = await http.get(Uri.parse(URL), headers: authGetHeaders);
      if(response.statusCode == 200){
        final List<SingleTeacher> teacherList = chattingTeacherListFromJson(utf8.decode(response.bodyBytes)).teacherList;
        return teacherList;
      }else {
        print('$URL 학부모: 선생님들 Error 발생 ');
        return <SingleTeacher>[];
      }
    }catch(e){
      print(e);
      return <SingleTeacher>[];
    }
  }
}