import 'package:app/components/medicine/medicine_sign_button.dart';
import 'package:flutter/material.dart';
import 'package:app/constants.dart';
import 'package:text_divider/text_divider.dart';
class MedicineDetailPage extends StatefulWidget {

  const MedicineDetailPage({Key? key}) : super(key: key);
  _MedicineDetailPageState createState() => _MedicineDetailPageState();
}

class _MedicineDetailPageState extends State<MedicineDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: [
          Expanded(child: SizedBox()),
          Flexible(
              flex:12,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("투약 의뢰서 내용",style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700
                        ),)
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsetsDirectional.symmetric(vertical: 15),
                          padding: EdgeInsets.fromLTRB(10, 0, 25, 0),
                          width: 180,
                          height: 52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            color: cardYellow,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.circle,size: 43, color:Colors.white),
                              Text("용용반",style: TextStyle(
                                fontSize: 16,
                              ),),
                              Text("이연희",style: TextStyle(
                                fontSize: 16,
                              ),)
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(    // 보란색 박스
                      width: 500,
                      height: 330,
                      margin: EdgeInsets.only(bottom: 15),
                      padding: EdgeInsets.symmetric(vertical: 30 ,horizontal: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: lightNavy,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              children: [
                                Text("증상 : ", style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),),
                                Text(" 몸살 감기", style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              children: [
                                Text("종류 : ", style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),),
                                Text(" 알약", style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              children: [
                                Text("용량 : ", style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),),
                                Text(" 개별 한 봉지 모두", style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              children: [
                                Text("횟수 : ", style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),),
                                Text(" 1회", style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              children: [
                                Text("시간 : ", style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),),
                                Text(" 식후 30분", style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              children: [
                                Text("보관 : ", style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),),
                                Text(" 실온 보관", style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),)
                              ],
                            ),
                          ),
                          Row(
                              children: [
                                Text("비고 : ", style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),),
                                Text(" 연희는 약 먹고 나면 딸기 사탕 주세요.", style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),)
                              ],
                            ),
                        ],
                      ),
                    ),
                    Text("투약으로 인한 책임은 의뢰자가 집니다.", style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("2023.04.19",style: TextStyle(
                            fontSize: 22
                          ),),
                          Text("김숙자",style: TextStyle(
                              fontSize: 22
                          ),),
                          Icon(Icons.check_circle_outline_rounded,size: 35, color:cardBtnPink)
                        ],
                      ),
                    ),

                    Divider(thickness: 1,height: 1,color: Colors.black26,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 5, 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("투약 보고서 내용",style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700
                          ),),
                          MedicineSignButton(),
                        ],
                      ),
                    ),
                    Text("금일 본 유치원/어린이집의 '이연희' 아동에 대해 의뢰하신", style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54
                    )),
                    Text("내용대로 투약 하였음을 보고합니다.", style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("2023.04.19",style: TextStyle(
                              fontSize: 22
                          ),),
                          Text("오선생",style: TextStyle(
                              fontSize: 22
                          ),),
                          Icon(Icons.check_circle_outline_rounded,size: 35, color:Colors.black12)
                        ],
                      ),
                    )
                  ],
                ),
              )),
          Expanded(child: SizedBox())
        ],
      ),
    );
  }
}
