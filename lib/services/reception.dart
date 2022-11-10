import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:smartlicense/controllers/admin_controller.dart';
import 'package:smartlicense/controllers/loading.dart';
import 'package:smartlicense/services/authentication.dart';
import 'package:smartlicense/views/admin/medical/medical_admin.dart';
import 'package:smartlicense/views/admin/super/super_admin.dart';
import 'package:smartlicense/views/admin/traffic/traffic_admin.dart';
import 'package:smartlicense/views/admin/waiting.dart';
import 'package:smartlicense/views/user/homepage.dart';
import '../controllers/user_controller.dart';
import '../model/type.dart';

class Reception {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  Future<UserType> fetchUserType() async {
    String type = "none";
    try {
      type = await firestore
          .collection("users")
          .doc(auth.currentUser!.uid)
          .get()
          .then((value) => value['userType'].toString());
    } catch (e) {
      try {
        type = await firestore
            .collection("admins")
            .doc(auth.currentUser!.uid)
            .get()
            .then((value) => value['userType'].toString());
      } catch (e) {
        return UserType().instance(type);
      }
      return UserType().instance(type);
    }
    return UserType().instance(type);
  }

  userReception() async {
    final type = await fetchUserType();
    if (type.user) {
      final a = Get.put(UserController());
      a.initUserStream();
      Get.offAll(() => HomePage());
    } else if (type.pendingAdmin) {
        loading(true);
      Get.put(AdminController());
      Get.offAll(() => WaitingRoom());
    } else if (type.superAdmin) {
      loading(true);
      Get.put(AdminController());
      Get.offAll(() => SuperAdmin());
    } else if (type.medicalAdmin) {
        loading(true);
      Get.put(AdminController());
      Get.offAll(() => MedicalAdmin());
    } else if (type.trafficAdmin) {
        loading(true);
      Get.put(AdminController());
      Get.offAll(() => TrafficAdmin());
    } else  {
      Authentication().signOut();
    }
  }
}
