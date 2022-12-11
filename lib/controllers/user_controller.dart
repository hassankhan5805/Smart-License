import 'package:get/get.dart';
import 'package:smartlicense/model/user.dart';
import 'package:smartlicense/services/user.dart';

final userCntr = Get.find<UserController>();

class UserController extends GetxController {
  final Rx<UserModel> user = UserModel().obs;
  RxList<UserModel>? allUsers = <UserModel>[].obs;

  initUserStream() {
    user.bindStream(UserServices().streamUser());
    allUsers!.bindStream(UserServices().streamAllUsers()!);

  }
}
