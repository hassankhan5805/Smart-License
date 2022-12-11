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
import 'package:smartlicense/views/user/form_registration.dart';
import '../controllers/user_controller.dart';

class Reception {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  Future<String?> fetchUserType() async {
    try {
      return await firestore
          .collection("users")
          .doc(auth.currentUser!.uid)
          .get()
          .then((value) => value['userType'].toString());
    } catch (e) {
      try {
        return await firestore
            .collection("admins")
            .doc(auth.currentUser!.uid)
            .get()
            .then((value) => value['userType'].toString());
      } catch (e) {
        return null;
      }
    }
  }

  userReception() async {
    final type = await fetchUserType();

    switch (type) {
      case "registration":
        Get.put(UserController()).initUserStream();
        
        Get.offAll(() => FormRegistration());
        break;
      case "regWaiting":
        Get.put(UserController()).initUserStream();

        break;
      case "medical":
        Get.put(UserController()).initUserStream();

        break;
      case "quizTraining":
        Get.put(UserController()).initUserStream();

        break;
      case "quiz":
        Get.put(UserController()).initUserStream();

        break;
      case "field":
        Get.put(UserController()).initUserStream();

        break;
      case "pickup":
        Get.put(UserController()).initUserStream();

        break;
      case "trafficAdmin":
        loading(true);
        Get.put(AdminController());
        Get.offAll(() => TrafficAdmin());

        break;
      case "medicalAdmin":
        loading(true);
        Get.put(AdminController());
        Get.offAll(() => MedicalAdmin());
        break;
      case "superAdmin":
        loading(true);
        Get.put(AdminController());
        Get.offAll(() => SuperAdmin());
        break;
      case "pendingAdmin":
        loading(true);
        Get.put(AdminController());
        Get.offAll(() => WaitingRoom());
        break;
      case "suspended":
        break;
      default:
        Authentication().signOut();
        break;
    }
  }

  Future<void> updateUserType(String type, String id) async {
    return await firestore
        .collection("users")
        .doc(id)
        .update({"userType": type});
  }
}
