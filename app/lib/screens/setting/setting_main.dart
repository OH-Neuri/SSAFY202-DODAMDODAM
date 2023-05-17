import 'package:app/components/common/custom_snackbar.dart';
import 'package:app/components/common/notify_appbar.dart';
import 'package:app/constants.dart';
import 'package:app/controller/deviceInfo_controller.dart';
import 'package:app/controller/root_controller.dart';
import 'package:app/controller/setting_controller.dart';
import 'package:app/screens/setting/change_setting.dart';
import 'package:app/screens/setting/privacy_page.dart';
import 'package:app/screens/user/login_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingMain extends StatelessWidget {

  final DeviceInfoController dc = Get.put(DeviceInfoController());
  final SettingController sc = Get.put(SettingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: NotifyAppBar(),
      endDrawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(top: 70.0 ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18.0, bottom: 14.0),
                child: Text('총 3개'),
              ),
              Divider(color: Colors.grey[400], height: 0.5, thickness: 0.5,),
              for(int i=0; i<3; i++)
              Container(
                height: 80,
                padding: EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: Color(0x30FFCF2C),
                  border: Border(
                    bottom: BorderSide(color: Color(0x80FFCF2C), width: 0.4)
                  )
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 24.0),
                      child: Image.asset('assets/images/common/벨.png', height: 30,),
                    ),
                    Expanded(child: Text('[[2024-20-30]] 알림장이 등록되었습니다.😍'))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 260,
            color: bottomYellow,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  width: 70,
                  height: 70,
                  child:
                  dc.isTeacher
                  ? CircleAvatar(backgroundImage: AssetImage('assets/images/common/flower_icon.png'),)
                  : CircleAvatar(backgroundImage: NetworkImage(dc.kidPhoto),)
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 4.0),
                  child: Text('${dc.name} 님', style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: subTitleTextSize
                  )),
                ),
                Text(dc.phone, style: TextStyle(
                  color: Colors.grey[800]
                ),),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 30),
                  decoration: BoxDecoration(
                    color: darkYellow,
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child:
                  dc.isTeacher
                  ? Text('${dc.className} 선생님', style: TextStyle(color: Colors.white),)
                  : Text('${dc.kidName} 학부모', style: TextStyle(color: Colors.white),),
                )
              ],
            ),
          ),

          // 여기부터 메뉴부분
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 26.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4.0, bottom: 12.0),
                  child: Text('환경설정', style: TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.grey[500]
                  ),),
                ),
                dc.isTeacher
                ? InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChangeSetting()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: SettingMenu(icon: Icons.cached, text: '반 추가/변경하기',),
                  ),
                )
                : InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChangeSetting()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: SettingMenu(icon: Icons.face, text: '아이 추가/변경하기',),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: InkWell(
                    onTap: (){
                      if(!dc.isTeacher) {
                        CustomSnackBar.errorSnackbar(context, '방해금지모드는 선생님만 이용할 수 있습니다.');
                        return;
                      }
                      // 여기서 이동해서 사용하면 됩니당...!
                      // for leeuh
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: SettingMenu(icon: Icons.unsubscribe_outlined, text: '방해 금지 모드',),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PrivacyPage()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: SettingMenu(icon: Icons.info_outline, text: '개인 정보 방침',),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){logout();},
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20))
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: SettingMenu(icon: Icons.logout, text: '로그아웃',),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void logout() {
    dc.setIsLogin(false);
    dc.setToken('');
    RootController.to.changeRootPageIndex(0);
    Get.offAll(LoginSelect());
  }
}

class SettingMenu extends StatelessWidget {
  final IconData icon;
  final String text;

  const SettingMenu({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Icon(icon, color: Colors.grey[800],),
        ),
        Text(text, style: TextStyle(
          fontSize: contentTextSize,
          color: Colors.grey[800]
          ),
        )
      ],
    );
  }
}
