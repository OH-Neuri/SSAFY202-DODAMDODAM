import 'package:app/components/common/logout_app_bar.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class NoticeDetail extends StatelessWidget {
  const NoticeDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        Row(
                          children: [
                            Expanded(child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.asset('images/bonggil.jpg'),
                            )),
                            Expanded(child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.asset('images/bonggil.jpg'),
                            )),
                            Expanded(child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.asset('images/bonggil.jpg'),
                            )),
                          ],
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
