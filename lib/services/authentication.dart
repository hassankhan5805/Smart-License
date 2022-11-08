import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:smartlicense/views/authentication/signin.dart';
import 'package:smartlicense/views/homepage.dart';
import '../../utils/snackbar.dart';
import '../controllers/all_controller.dart';

class Authentication {
  FirebaseAuth auth = FirebaseAuth.instance;
  createAccount(
      {required String name,
      required String email,
      required String pass,
      required bool admin,
      required bool isAdmin,
      required String adminType,
      required String designation}) async {
    loading.isLoading.value = true;
    try {
      final user = await auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      await user.user!.updateDisplayName(name);
      if (user.user != null) {
        loading.isLoading.value = false;
        Get.off(() => HomePage());
      } else {
        loading.isLoading.value = false;
        alertSnackbar(
          "Unknown Error",
        );
      }
    } catch (e) {
      loading.isLoading.value = false;
      alertSnackbar(e.toString().contains(']')
          ? e.toString().split(']').last
          : e.toString()); //TODO firebase errors list
    }
  }

  signinWithEmail(String email, String pass) async {
    try {
      loading.isLoading.value = true;
      await auth
          .signInWithEmailAndPassword(email: email, password: pass)
          .then((value) {
        if (value.user != null) {
          loading.isLoading.value = false;

          Get.off(() => HomePage());
        } else {
          loading.isLoading.value = false;
          alertSnackbar("Unknown error");
        }
      });
    } catch (e) {
      loading.isLoading.value = false;
      alertSnackbar(e.toString().split(']').last); //TODO firebase exception
    }
  }

  forgotPassword(String email) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      //TODO set email compariseon after setting up user controller
      await auth.sendPasswordResetEmail(email: email);
      loading.isLoading.value = false;
      snackbar('Success', 'Password reset email sent to ${email}');
    } catch (e) {
      loading.isLoading.value = false;
      alertSnackbar(e.toString().split(']').last); //TODO firebase exception
    }
  }

  signOut() async {
    try {
      await auth.signOut();
      Get.offAll(() => Signin());
    } catch (e) {
      snackbar("Error Signing Out", e.toString()); //TODO firebase exception
    }
  }
}
