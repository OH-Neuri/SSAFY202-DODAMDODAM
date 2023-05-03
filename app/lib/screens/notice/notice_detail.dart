import 'package:app/components/common/logout_app_bar.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoticeDetail extends StatelessWidget {
  const NoticeDetail({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
  List<String> images = ['images/bonggil.jpg','images/bonggil.jpg'];
    return Scaffold(
      backgroundColor: lightNavy,
      appBar: LogoutAppBar(),
      body: Row(
        children: [
          Expanded(child: SizedBox()),
          Flexible(flex: 12,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 2, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(onPressed: (){},
                            style: TextButton.styleFrom(
                              shape: CircleBorder(),
                              foregroundColor: logoNavy,
                            ),
                            child: Icon(Icons.create_outlined)),
                        TextButton(onPressed: (){},
                            style: TextButton.styleFrom(
                              shape: CircleBorder(),
                              foregroundColor: logoNavy,
                            ),
                            child: Icon(Icons.delete_outlined)),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(DateTime.now().toString()),
                            Text('@전체 원생', style: TextStyle(color: Colors.grey),)
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Divider(color: Colors.grey, height: 1, thickness: 1),
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
                                  onTap: () {Get.toNamed('/notice/image/$i', arguments: images);},
                                  child: Image.asset(images[i], fit: BoxFit.cover,)
                                ),
                              Image.network('https://dodamdodam.s3.ap-northeast-2.amazonaws.com/kidProfile/3d0aaa2f-f539-437f-bc02-50c391ef0fd6.jpg', fit: BoxFit.cover,),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
                          child: Text('봉길이랑 봉길이랑 봉길이다!봉길이랑 봉길이랑 봉길이다!봉길이랑 봉길이랑 봉길이다!봉길이랑 봉길이랑 봉길이다!봉길이랑 봉길이랑 봉길이다!봉길이랑 봉길이랑 봉길이다!봉길이랑 봉길이랑 봉길이다!'),
                        )
                      ],
                    ),
                  )
                ],
              )
          ),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
