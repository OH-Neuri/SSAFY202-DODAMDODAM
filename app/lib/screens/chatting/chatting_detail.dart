import 'package:app/components/common/title_appBar.dart';
import 'package:flutter/material.dart';

class ChattingDetail extends StatefulWidget {
  const ChattingDetail({Key? key}) : super(key: key);

  @override
  State<ChattingDetail> createState() => _ChattingDetailState();
}

class _ChattingDetailState extends State<ChattingDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TitleAppBar(title: "채팅 상세 페이지"),
        body: Text("채팅 상세페이지이다."),
    );
  }
}
