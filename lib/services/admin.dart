import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smartlicense/model/admin.dart';
import 'package:smartlicense/services/reception.dart';

import '../controllers/loading.dart';
import '../utils/snackbar.dart';

class AdminServices {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  registerAdmin(
      {required String name,
      required String appliedFor,
      required String designation,
      required User user}) async {
    var x = AdminModel(
        uid: user.uid,
        name: name,
        email: user.email,
        registeredOn: Timestamp.now(),
        type: "pendingAdmin",
        appliedFor: appliedFor,
        designation: designation);
    try {
      await firestore.collection("admins").doc(user.uid).set(x.toJson());
      loading(false);
      Reception().userReception();
    } catch (e) {
      loading(false);
      alertSnackbar("Can't register admin");
    }
  }

  Stream<AdminModel>? streamAdmin() {
    try {
      return firestore
          .collection("admins")
          .doc(auth.currentUser!.uid)
          .snapshots()
          .map((event) {
        loading(false);
        return AdminModel.fromJson(event.data()!);
      });
    } catch (e) {
      loading(false);
      return null;
    }
  }

  Stream<List<AdminModel>>? streamAllAdmins() {
    try {
      return firestore.collection("admins").snapshots().map((event) {
        loading(false);
        List<AdminModel> list = [];
        event.docs.forEach((element) {
          final admin = AdminModel.fromJson(element.data());
          if (admin.uid != auth.currentUser!.uid && !admin.userType!.blocked)
            list.add(admin);
        });
        loading(false);
        return list;
      });
    } catch (e) {
      loading(false);
      return null;
    }
  }

  approveAdmin(AdminModel admin) async {
    try {
      final appliedFor = admin.appliedFor!.contains("Super")
          ? "superAdmin"
          : admin.appliedFor!.contains("Traffic")
              ? "trafficAdmin"
              : "medicalAdmin";
      loading(true);
      print("objectUID");
      print(admin.uid);
      await firestore
          .collection("admins")
          .doc(admin.uid)
          .update({"userType": appliedFor});
      loading(false);
    } catch (e) {
      print(e.toString());
      loading(false);
    }
  }

  blockrequest(AdminModel admin) async {
    try {
      loading(true);
      await firestore
          .collection("admins")
          .doc(admin.uid)
          .update({"userType": "blocked"});
      loading(false);
    } catch (e) {
      loading(false);
    }
  }
}
