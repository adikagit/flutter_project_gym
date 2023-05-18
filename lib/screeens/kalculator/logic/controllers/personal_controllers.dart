import 'package:adigym/db/db_helper.dart';
import 'package:adigym/screeens/kalculator/logic/models/personal.dart';
import 'package:get/get.dart';

class PersonalControllers extends GetxController {
  @override
  void onReady() {
    getPersonal();
    super.onReady();
  }

  var personalList = <Personal>[].obs;

  Future<int> addPersonal({Personal? personal}) async {
    return await DBHelper.insertPersonal(personal);
  }

  void getPersonal() async {
    List<Map<String, dynamic>> personal = await DBHelper.queryPersonal();
    personalList.assignAll(personal.map((data) => Personal.fromJson(data)));
  }

  Future<int?> updatePersonal(Personal personal) async{
     return await DBHelper.updatePersonal(personal);
  }
}
