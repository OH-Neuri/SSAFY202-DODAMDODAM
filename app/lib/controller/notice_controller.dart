import 'package:app/api/notice_service.dart';
import 'package:app/models/notice/class_kid_list_model.dart';
import 'package:app/models/notice/notice_detail_model.dart';
import 'package:app/models/notice/notice_list_model.dart';
import 'package:get/get.dart';

class NoticeController extends GetxController {
  static NoticeController get to => Get.find();

  // 알림장 변수들...
  // -----------------------------------
  List<NoticeListItem> noticeList = <NoticeListItem>[];
  NoticeDetail noticeDetail = NoticeDetail(announcement: true, content: '', date: '', kid: [], noticeSeq: 0, photo: []);
  String aiNotice = '';
  int selectedYear = 0;
  int selectedMonth = 0;
  List<ClassKid> kidList = <ClassKid>[];
  List<int> selectKids = <int>[];

  @override
  void onInit() async {
    setNoticeList();
    setKidList();
    super.onInit();
    update();
  }

  // 1. 전체(default) 알림장 리스트 불러오기
  // 2. 선택한 년/월이 있으면 해당 리스트 불러오기
  void setNoticeList() async {
    try {
      if(selectedYear == 0 && selectedMonth == 0){
        noticeList = await NoticeService.getNoticeList();
      }else {
        noticeList = await NoticeService.getNoticeListByMonth(selectedYear, selectedMonth);
      }
    } catch (e) {
      print(e);
    }
    update();
  }

  // 알림장 디테일 불러오기 ( noticeSeq에 해당하는 )
  void setNoticeDetail(int noticeSeq) async {
    try {
      noticeDetail = await NoticeService.getNoticeDetail(noticeSeq);
    } catch (e) {
      print(e);
    }
    update();
  }

  // ai가 작성한 알림장
  void setAiNotice(String value) {
    aiNotice = value;
    update();
  }

  // 선택한 년 변경
  void setSelectedYear(int value) {
    selectedYear = value;
    update();
  }

  // 선택한 월 변경
  void setSelectedMonth(int value) {
    selectedMonth = value;
    update();
  }

  // 원생 리스트
  void setKidList() async {
    try {
      kidList = await NoticeService.getClassKidList();
    } catch (e) {
      print(e);
    }
    update();
  }

  // 글 등록할 때, 선택한 원생 리스트
  void setSelectKid(List<int> selectKidList) {
    selectKids = selectKidList;
    update();
  }
}