import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:smartlicense/views/authentication/signin.dart';
import 'package:smartlicense/views/homepage.dart';
import '../../utils/snackbar.dart';
import '../controllers/loading.dart';

createAccount(String name, String email, String pass) async {
  Get.find<LoadingController>().isLoading.value = true;

  FirebaseAuth auth = FirebaseAuth.instance;
  try {
    await auth
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((value) async {
      if (value.user != null) {
        await value.user!.updateDisplayName(name);
        Get.find<LoadingController>().isLoading.value = false;

        Get.off(() => HomePage());
      } else
        failure("Unknown Error");
    });
  } catch (e) {
    Get.find<LoadingController>().isLoading.value = false;

    snackbar(
        'Failed',
        e.toString().contains(']')
            ? e.toString().split(']').last
            : e.toString());
  }
}

failure(String e) {
  final loading = Get.find<LoadingController>();

  loading.isLoading.value = false;

  snackbar(
    'Failed',
    e.toString().contains(']') ? e.toString().split(']').last : e.toString(),
  );
}

signinWithEmail(String email, String pass) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  try {
    await auth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((value) {
      if (value.user != null) {
        Get.find<LoadingController>().isLoading.value = false;

        Get.off(() => HomePage());
      } else
        failure("Unknown error");
    });
  } catch (e) {
    failure(e.toString().split(']').last);
  }
}

forgotPassword(String email) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  final loading = Get.find<LoadingController>();

  try {
    await auth.sendPasswordResetEmail(email: email);
    loading.isLoading.value = false;
    snackbar('Success', 'Password reset email sent to ${email}');
  } catch (e) {
    failure(e.toString().split(']').last);
  }
}

Future<String> signOut() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  try {
    await auth.signOut();
    Get.offAll(() => Signin());
    return "null";
  } catch (e) {
    snackbar("Error Signing OuT", e.toString());
    return e.toString();
  }
}
