import 'package:app/api/setting_service.dart';
import 'package:app/components/common/title_appBar.dart';
import 'package:app/constants.dart';
import 'package:app/controller/setting_controller.dart';
import 'package:app/models/setting/sleep_mode_time_model.dart';
import 'package:app/utils/time_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SleepModePage extends StatefulWidget {
  const SleepModePage({Key? key}) : super(key: key);

  @override
  State<SleepModePage> createState() => _SleepModePageState();
}

bool isOn = false;
String startTime = '19:00:00';
String endTime = '07:00:00';
class _SleepModePageState extends State<SleepModePage> {
  @override
  Widget build(BuildContext context) {
    SettingController sc = Get.put(SettingController());
    return GetBuilder<SettingController>(builder: (_)=>
        Scaffold(
          appBar: TitleAppBar(title: '방해 금지 모드',),
          body: Row(
            children: [
              Expanded(child: SizedBox()),
              Flexible(
                  flex: 12,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 12.0, top: 6),
                                  child: Icon(Icons.unsubscribe_outlined, color: Colors.grey[700], size: 28,),
                                ),
                                Text('방해 금지 모드', style: TextStyle(color: Colors.grey[800], fontSize: 18),)
                              ],
                            ),
                            Switch(
                              value: sc.sleepModeTime.sleepModeStart == null ? false : true,
                              onChanged: (value){
                                setState(() {
                                  isOn = value;
                                });
                                if(value) {
                                  SettingService.modifySleepModeTime(SleepModeTime(sleepModeStart: '00:00:00', sleepModeEnd: '00:00:00'));
                                }else{
                                  SettingService.modifySleepModeTime(SleepModeTime(sleepModeStart: '', sleepModeEnd: ''));
                                }
                              },
                              inactiveTrackColor: Colors.grey[400],
                              activeColor: darkYellow,
                            )
                          ],
                        ),
                      ),
                      Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(left: 4, top: 6),
                          child: Text('설정해둔 시간에는 알림이 오지 않습니다.', style: TextStyle(color: Colors.grey[700]),)
                      ),
                      sc.sleepModeTime.sleepModeStart != null
                          ? SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                              child: Text('시작 시간', style: TextStyle(fontWeight: FontWeight.w600, fontSize: contentTextSize),),
                            ),
                            InkWell(
                                onTap: () async {
                                  final time = await showTimePickerDialog(startTime);
                                  if(time != ''){
                                    SettingService.modifySleepModeTime(SleepModeTime(sleepModeStart: time, sleepModeEnd: sc.sleepModeTime.sleepModeEnd));
                                  }
                                },
                                child: TimePickerButton(time: sc.sleepModeTime.sleepModeStart)
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Text('끝나는 시간', style: TextStyle(fontWeight: FontWeight.w600, fontSize: contentTextSize),),
                            ),
                            InkWell(
                                onTap: () async {
                                  final time = await showTimePickerDialog(endTime);
                                  if(time != ''){
                                    SettingService.modifySleepModeTime(SleepModeTime(sleepModeStart: sc.sleepModeTime.sleepModeStart, sleepModeEnd: time));
                                  }
                                },
                                child: TimePickerButton(time: sc.sleepModeTime.sleepModeEnd)
                            ),
                          ],
                        ),
                      )
                          : SizedBox(),
                    ],
                  )
              ),
              Expanded(child: SizedBox()),
            ],
          ),
        )
    );
  }
  Future<String> showTimePickerDialog(String time) async {
    TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: stringToTime(time),
        confirmText: '확인',
        cancelText: '취소'
    );
    if (selectedTime != null) {
      return timeToString(selectedTime);
    } else {
      return ''; // 또는 다른 기본값 설정
    }
  }
}

class TimePickerButton extends StatelessWidget {
  final String time;

  const TimePickerButton({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.grey[200],
            ),
            margin: EdgeInsets.all(10),
            child: Center(child: Text(time[0], style: TextStyle(
                fontSize: titleTextSize,
                fontWeight: FontWeight.w700,
                color: Colors.grey[700]
            ),),),),
        ),
        Expanded(
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.grey[200],
            ),
            margin: EdgeInsets.all(10),
            child: Center(child: Text(time[1], style: TextStyle(
                fontSize: titleTextSize,
                fontWeight: FontWeight.w700,
                color: Colors.grey[700]
            ),),),),
        ),
        Text(':', style: TextStyle(fontSize: titleTextSize, color: Colors.grey[500]),),
        Expanded(
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.grey[200],
            ),
            margin: EdgeInsets.all(10),
            child: Center(child: Text(time[3], style: TextStyle(
                fontSize: titleTextSize,
                fontWeight: FontWeight.w700,
                color: Colors.grey[700]
            ),),),),
        ),
        Expanded(
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.grey[200],
            ),
            margin: EdgeInsets.all(10),
            child: Center(child: Text(time[4], style: TextStyle(
                fontSize: titleTextSize,
                fontWeight: FontWeight.w700,
                color: Colors.grey[700]
            ),),),),
        ),
      ],
    );
  }
}