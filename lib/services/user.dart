import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smartlicense/model/user.dart';
import 'package:smartlicense/services/reception.dart';
import 'package:smartlicense/utils/snackbar.dart';
import '../controllers/loading.dart';

class UserServices {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  registerUser({required String name, required User user}) async {
    var x = UserModel(
      name: name,
      email: user.email!,
      userType: "registration",
    );
    try {
      await firestore.collection("users").doc(user.uid).set(x.toJson());
      loading(false);
      Reception().userReception();
    } catch (e) {
      loading(false);
      alertSnackbar("Can't register user");
    }
  }

  Stream<UserModel> streamUser()  {
    return  firestore
        .collection("users")
        .doc(auth.currentUser!.uid)
        .snapshots()
        .map((event) => UserModel.fromJson(event.data()!));
  }
}
