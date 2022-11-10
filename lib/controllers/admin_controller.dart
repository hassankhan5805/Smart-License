import 'package:get/get.dart';
import 'package:smartlicense/model/admin.dart';
import 'package:smartlicense/services/admin.dart';

final adminCntr = Get.find<AdminController>();

class AdminController extends GetxController {
  Rx<AdminModel>? admin = AdminModel().obs;
  RxList<AdminModel>? allAadmins = <AdminModel>[].obs;
  // AdminModel get getAdmin => admin.value;
  @override
  void onReady() {
    initAdminStream();
  }

  initAdminStream() async {
    admin!.bindStream(AdminServices().streamAdmin()!);
    allAadmins!.bindStream(AdminServices().streamAllAdmins()!);
  }
}
