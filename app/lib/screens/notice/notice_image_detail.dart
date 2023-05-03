import 'package:app/components/common/logout_app_bar.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoticeImageDetail extends StatefulWidget {
  const NoticeImageDetail({Key? key}) : super(key: key);

  @override
  State<NoticeImageDetail> createState() => _NoticeImageDetailState();
}

class _NoticeImageDetailState extends State<NoticeImageDetail> {
  // List<String> images = Get.arguments;
  List<String> images = ['images/bonggil.jpg','images/logo.png'];
  int idx = -1;

  @override
  void initState() {
    super.initState();
    idx = int.parse(Get.parameters['idx'] as String);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: lightNavy,
      appBar: LogoutAppBar(),
      body: Row(
        children: [
          Expanded(child: SizedBox()),
          Flexible(
              flex: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: Text('${idx+1} / ${images.length}', style: TextStyle(fontSize: subTitleTextSize),),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: textColor,
                          backgroundColor: Colors.white,
                        ),
                        onPressed: (){},
                        child: Icon(Icons.save_alt_outlined)
                      ),
                    ]
                  ),
                  Container(
                    color: Color(0x30000000),
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
                    width: double.infinity,
                    height: 500,
                    child: Image.asset(images[idx], height: 300, fit: BoxFit.contain,)
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                    ),
                      children: [
                        for(int i=0; i<images.length; i++)
                          InkWell(
                              onTap: () {setState(() {
                                idx = i;
                              });},
                              child: Image.asset(images[i], fit: BoxFit.cover,)
                          ),
                        // Image.network('https://dodamdodam.s3.ap-northeast-2.amazonaws.com/kidProfile/3d0aaa2f-f539-437f-bc02-50c391ef0fd6.jpg', fit: BoxFit.cover,),
                      ],
                    ),
                  ),
                ],
              )),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
