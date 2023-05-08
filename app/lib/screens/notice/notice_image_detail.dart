import 'package:app/components/common/logout_app_bar.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoticeImageDetail extends StatefulWidget {
  const NoticeImageDetail({Key? key, required this.images, required this.index}) : super(key: key);
  final List<String> images;
  final int index;

  @override
  State<NoticeImageDetail> createState() => _NoticeImageDetailState();
}

class _NoticeImageDetailState extends State<NoticeImageDetail> {
  int idx = -1;
  @override
  void initState() {
    super.initState();
    idx = widget.index;
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
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Text('${idx+1} / ${widget.images.length}', style: TextStyle(fontSize: buttonTextSize),),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: textColor,
                        ),
                        onPressed: (){},
                        child: Icon(Icons.save_alt_outlined)
                      ),
                    ]
                  ),
                  Container(
                    color: Color(0x10000000),
                    // margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                    width: double.infinity,
                    height: 380,
                    child: Image.network(widget.images[idx], height: 200, fit: BoxFit.contain,)
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 120,
                    child: GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                    ),
                      children: [
                        for(int i=0; i<widget.images.length; i++)
                          Container(
                            decoration: BoxDecoration(
                              border: idx == i ? Border.all(color: logoYellow, width: 4) : null
                            ),
                            child: InkWell(
                                onTap: () {setState(() {
                                  idx = i;
                                });},
                                child: Image.network(widget.images[i], fit: BoxFit.cover,)
                            ),
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
