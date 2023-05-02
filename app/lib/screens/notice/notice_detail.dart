import 'package:app/components/common/logout_app_bar.dart';
import 'package:app/constants.dart';
import 'package:app/screens/user/signup_id.dart';
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
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      children: [
                        Text('xxxxxx')
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
