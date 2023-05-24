import 'package:app/components/today/oneline_food.dart';
import 'package:app/controller/food_controller.dart';
import 'package:flutter/material.dart';
import 'package:app/constants.dart';
import 'package:get/get.dart';

class CalendarFood extends StatelessWidget {
  const CalendarFood({super.key});

  @override
  Widget build(BuildContext context) {
    FoodController fc = Get.put(FoodController());
    return GetBuilder<FoodController>(
        builder: (_) =>
            Column(
              children: [
                // 오늘의 급식 타이틀
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 0, 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          "${fc.choiceDay.month}/${fc.choiceDay.day} ${fc.dayWeek} ",
                          style: TextStyle(fontSize: buttonTextSize, fontWeight: FontWeight.w600)
                      ),
                      Image.asset('assets/images/common/식단.png', height: 24, width: 24,)
                    ],
                  ),
                ),
                // 급식 내용 박스
                Container(
                  height: 250, width: double.infinity,
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: lightNavy,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 5.0,
                        offset: Offset(0, 4),
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
                                      child: Text("점심", style: TextStyle(fontWeight: FontWeight.w600 ,color: darkNavy)),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      OneLineFood(menu: fc.food.rice),
                                      OneLineFood(menu: fc.food.soup),
                                      OneLineFood(menu: fc.food.dish1),
                                      OneLineFood(menu: fc.food.dish2),
                                      OneLineFood(menu: fc.food.dish3),
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
                                          children: [Text("오전 간식", style: TextStyle(fontWeight: FontWeight.w600 ,color: darkNavy))],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 80,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            OneLineFood(menu: fc.food.morningSnack1),
                                            OneLineFood(menu: fc.food.morningSnack2),
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
                                          children: [Text("오후 간식", style: TextStyle(fontWeight: FontWeight.w600 ,color: darkNavy))],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 80,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            OneLineFood(menu: fc.food.afternoonSnack1),
                                            OneLineFood(menu: fc.food.afternoonSnack2),
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
            ));
  }
}
