import 'package:app/api/medicine_service.dart';
import 'package:app/models/medicine/medicine_kid_month_list_model.dart';
import 'package:app/models/medicine/medicine_kid_detail_model.dart';
import 'package:app/models/medicine/medicine_class_list_model.dart';

import 'package:get/get.dart';

class MedicineController extends GetxController {
  static MedicineController get to => Get.find();

  List<MedicineClassList> medicineClassList = <MedicineClassList>[];
  MedicineKidDetail medicineKidDetail = MedicineKidDetail(medicineSeq: 0, kidSeq: 0, symptom: "", pill: "", capacity: "", count: "", time: "", keep: "", content: "", requestDate: "", requestName: "",responseDate:"" ,responseName: "");
  List<MedicineKidMonth> medicineKidMonth = <MedicineKidMonth>[];

  @override
  void onInit() async{
    // 원생 리스트 가져오기
    setMedicineClassList(DateTime.now());
    super.onInit();
    update();
  }

  //  반별 투약 확인서 리스트 가져오기 (선생님용) - 32
  void setMedicineClassList(DateTime day) async {
    try{
      medicineClassList = await MedicineService.getMedicineClassList(day);
    }catch(e){
      print(e);
    }
    update();
  }


}