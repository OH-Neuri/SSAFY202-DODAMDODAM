import 'package:app/components/common/logout_app_bar.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class NoticeRegist extends StatefulWidget {
  const NoticeRegist({Key? key}) : super(key: key);

  @override
  State<NoticeRegist> createState() => _NoticeRegistState();
}

class _NoticeRegistState extends State<NoticeRegist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightNavy,
      appBar: LogoutAppBar(),
      body: Row(
        children: [
          Expanded(child: SizedBox()),
          Flexible(
            flex: 12,
            child: Column(

            )
          ),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
