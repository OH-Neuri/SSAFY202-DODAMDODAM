import 'dart:convert';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/models/chatting/chatting_user_list_model.dart';
import 'package:http/http.dart' as http;
import 'package:app/api/url_mapping.dart';

class ChattingService {
  // 친구목록 - 선생님에게 보여줄 학부모들
  static Future<List<SingleUser>> getChatUserList() async{
    String URL = '${url}chat/parent/${DeviceInfoController.to.classSeq}';
    try{
      final response = await http.get(Uri.parse(URL));
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
}