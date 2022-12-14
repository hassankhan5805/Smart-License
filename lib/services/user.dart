import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/route_manager.dart';
import 'package:smartlicense/model/user.dart';
import 'package:smartlicense/utils/snackbar.dart';
import '../controllers/loading.dart';
import '../controllers/user_controller.dart';
import '../views/authentication/email_verification.dart';

class UserServices {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  registerUser({required String name, required User user}) async {
    var x = UserModel(
        name: name,
        email: user.email!,
        userType: "registration",
        id: user.uid,
        appliedOn: DateTime.now().toString());
    try {
      await firestore.collection("users").doc(user.uid).set(x.toJson());
      userCntr.initUserStream();
      loading(false);
      Get.offAll(() => EmailVerification());
    } catch (e) {
      loading(false);
      alertSnackbar("Can't register user");
    }
  }

  Stream<UserModel> streamUser() {
    return firestore
        .collection("users")
        .doc(auth.currentUser == null ? "sdfsfd" : auth.currentUser!.uid)
        .snapshots()
        .map((event) => UserModel.fromJson(event.data()!));
  }

  Stream<List<UserModel>>? streamAllUsers() {
    try {
      return firestore.collection("users").snapshots().map((event) {
        loading(false);
        List<UserModel> list = [];
        event.docs.forEach((element) {
          list.add(UserModel.fromJson(element.data()));
        });
        loading(false);
        return list;
      });
    } catch (e) {
      loading(false);
      return null;
    }
  }
}
