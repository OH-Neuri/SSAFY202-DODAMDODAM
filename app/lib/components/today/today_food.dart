import 'package:app/api/food_service.dart';
import 'package:app/components/today/oneline_food.dart';
import 'package:app/utils/convert_dayToWeek.dart';
import 'package:flutter/material.dart';
import 'package:app/constants.dart';
import 'package:app/models/schedule/singleday_food_model.dart';

class TodayFood extends StatefulWidget {
  final String year;
  final String month;
  final String day;
  final String week;

  TodayFood({super.key, required this.year, required this.month, required this.day})
    : week = getDayOfWeek(int.parse(year), int.parse(month), int.parse(day));
  @override
  State<TodayFood> createState() => _TodayFoodState();
}

class _TodayFoodState extends State<TodayFood> {
  OneDayFood _onedayFood = OneDayFood(foodSeq: 1, rice: null, soup: null, dish1: null, dish2: null, dish3: null, morningSnack1: null, morningSnack2: null, afternoonSnack1: null, afternoonSnack2: null);
  bool loading = false;

  // 처음에 오늘 급식 리스트 받아와서 띄워주기
  @override
  void initState() {
    super.initState();
    FoodService.getOneDayFood(widget.year, widget.month, widget.day).then((value) => {
      setState(() {
        _onedayFood = value;
        loading = true;
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 오늘의 급식 타이틀
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 30, 0, 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${widget.month}/${widget.day} ${widget.week} ", style: TextStyle(fontSize: buttonTextSize, fontWeight: FontWeight.w600)),
              Image.asset('assets/images/common/diet_icon.png', height: 30, width: 30,)
            ],
          ),
        ),
        // 급식 내용 박스
        Container(
            height: 250, width: double.infinity,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: lightNavy,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 5.0,
                  offset: Offset(0, 10),
                ),
              ],
            ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                // 점심 내용
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                            child: Text("점심", style: TextStyle(fontWeight: FontWeight.w600 ,color: logoNavy)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              OneLineFood(menu: _onedayFood.rice),
                              OneLineFood(menu: _onedayFood.soup),
                              OneLineFood(menu: _onedayFood.dish1),
                              OneLineFood(menu: _onedayFood.dish2),
                              OneLineFood(menu: _onedayFood.dish3),
                            ],
                        ),
                      )
                    ],
                  )
                ),
                // 간식 내용
                Expanded(
                    child: Column(
                      children: [
                        // 오전 간식
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [Text("오전 간식", style: TextStyle(fontWeight: FontWeight.w600 ,color: logoNavy))],
                                ),
                              ),
                              SizedBox(
                                height: 80,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    OneLineFood(menu: _onedayFood.morningSnack1),
                                    OneLineFood(menu: _onedayFood.morningSnack2),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        // 오후 간식
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [Text("오후 간식", style: TextStyle(fontWeight: FontWeight.w600 ,color: logoNavy))],
                                ),
                              ),
                              SizedBox(
                                height: 80,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    OneLineFood(menu: _onedayFood.afternoonSnack1),
                                    OneLineFood(menu: _onedayFood.afternoonSnack2),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
