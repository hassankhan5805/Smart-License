import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:smartlicense/constants/strings.dart';
import 'package:smartlicense/controllers/admin_controller.dart';
import 'package:smartlicense/controllers/loading.dart';
import 'package:smartlicense/model/user.dart';
import 'package:smartlicense/utils/snackbar.dart';
import 'package:smartlicense/views/admin/medical/medical_admin.dart';
import 'package:smartlicense/views/admin/super/super_admin.dart';
import 'package:smartlicense/views/admin/traffic/traffic_admin.dart';
import 'package:smartlicense/views/admin/waiting.dart';
import 'package:smartlicense/views/authentication/email_verification.dart';
import 'package:smartlicense/views/authentication/signin.dart';
import 'package:smartlicense/views/user/form_registration.dart';

import '../views/quiz/quiz.dart';
import '../views/quiz/quiz_training.dart';

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

  Future<void> userReception() async {
    final type = await fetchUserType();
    if (FirebaseAuth.instance.currentUser == null) {
      Get.offAll(() => Signin());
    } else if (!(FirebaseAuth.instance.currentUser!.emailVerified)) {
      Get.offAll(() => EmailVerification());
    } else
      switch (type) {
        case AllStrings.registrationType:
          Get.offAll(() => FormRegistration());
          break;
        case AllStrings.regWaitingType:
          Get.offAll(() => WaitingRoom());
          break;
        case AllStrings.medicalType:
          Get.offAll(() => WaitingRoom());
          break;
        case AllStrings.quizTrainingType:
          Get.offAll(() => QuizTraining());
          break;
        case AllStrings.quizType:
          Get.offAll(() => Quiz());
          break;
        case AllStrings.fieldType:
          Get.offAll(() => WaitingRoom());
          break;
        case AllStrings.pickupType:
          Get.offAll(() => WaitingRoom());
          break;
        case AllStrings.trafficAdminType:
          Get.offAll(() => TrafficAdmin());
          break;
        case AllStrings.fieldPaymentType:
          Get.offAll(() => WaitingRoom());
          break;
        case AllStrings.pickupPaymentType:
          Get.offAll(() => WaitingRoom());
          break;
        case AllStrings.medicalPaymentType:
          Get.offAll(() => WaitingRoom());
          Get.offAll(() => WaitingRoom());
          break;
        case AllStrings.medicalAdminType:
          Get.offAll(() => MedicalAdmin());
          break;
        case AllStrings.superAdminType:
          Get.offAll(() => SuperAdmin());
          break;
        case AllStrings.pendingAdminType:
          Get.offAll(() => WaitingRoom());
          break;
        case AllStrings.suspendedType:
          Get.offAll(() => WaitingRoom());
          break;
        default:
          Get.offAll(() => WaitingRoom());
          break;
      }
  }

  Future<void> updateUserType(String type, String id) async {
    return await firestore
        .collection(AllStrings.userCollection)
        .doc(id)
        .update({AllStrings.userType: type});
  }

  //update medical relevance
  //update medical payment relevance
  //update medical
  //update quiz
  //update field payment
  //update field test
  //update license payment
  //update license pickup

  Future<void> updateFormRelevance(UserModel user, bool? accept,
      {String formComments = ""}) async {
    return await firestore
        .collection(AllStrings.userCollection)
        .doc(user.id)
        .update(user
            .copyWith(
                formApprovedBy: "${adminCntr.admin!.value.name}",
                formApprovedOn: DateTime.now().toString())
            .toJson());
  }

  Future<void> updateMedicalPaymentRelevanceForUser(
      {required UserModel user, required String txid}) async {
    await firestore.collection(AllStrings.userCollection).doc(user.id).update(
        user
            .copyWith(
                medicalPaymentStatus: "Waiting for approval",
                medicalPaymentUpdatedOn: DateTime.now().toString(),
                medicalPaymentTxID: txid)
            .toJson());
  }

  Future<void> updateMedicalPaymentRelevanceForAdmin(
      {required UserModel user,
      required bool accept,
      required String declineReason}) async {
    await firestore.collection(AllStrings.userCollection).doc(user.id).update(
        user
            .copyWith(
                medicalPaymentStatus: accept ? "Accepted" : "$declineReason",
                medicalPaymentUpdatedOn: DateTime.now().toString(),
                medicalPaymentUpdatedBy: "${adminCntr.admin!.value.name}",
                userType: accept
                    ? AllStrings.medicalType
                    : AllStrings.medicalPaymentType)
            .toJson());
  }

  Future<void> updateMedicalRelevance(
      {required UserModel user,
      required bool accept,
      required String formComments}) async {
    return await firestore
        .collection(AllStrings.userCollection)
        .doc(user.id)
        .update(user
            .copyWith(
                medicalResultGivenBy: "${adminCntr.admin!.value.name}",
                medicalComments: formComments,
                medicalResult: accept ? "Fit" : "Unfit",
                medicalResultDeclaredOn: DateTime.now().toString(),
                userType: accept
                    ? AllStrings.quizTrainingType
                    : AllStrings.permanentlyRejectedType)
            .toJson());
  }

  Future<void> updateQuizTrainingRelevance(UserModel user) async {
    loading(true);
    await firestore.collection(AllStrings.userCollection).doc(user.id).update(
        user
            .copyWith(
                quizTrainingStatus: "completed", userType: AllStrings.quizType)
            .toJson());
    await userReception();
    loading(false);

    return;
  }

  Future<void> updateQuizRelevance(UserModel user,
      {required RxList<int> result}) async {
    loading(true);
    int score = 0;
    for (int i = 0; i < result.length; i++) {
      score += result[i];
    }
    await firestore
        .collection(AllStrings.userCollection)
        .doc(user.id)
        .update(user
            .copyWith(
                quizAttempts: (user.quizAttempts ?? 0) + 1,
                quizResult: score.toString() + "/10",
                quizResultDate: DateTime.now().toString(),
                quizResultStatus: "Declared ${result}",
                userType: score < 10 //TODO
                    ? AllStrings.quizTrainingType
                    : AllStrings.fieldType)
            .toJson());
    score < 10
        ? alertSnackbar("Test Failed, Try again")
        : snackbar("Test Success", "");
    await userReception();
    loading(false);
  }

  Future<void> updateFieldRelevance(
      {required UserModel user,
      required bool accept,
      required String comments}) async {
    return await firestore
        .collection(AllStrings.userCollection)
        .doc(user.id)
        .update(user
            .copyWith(
                drivingTestMonitor: "${adminCntr.admin!.value.name}",
                drivingTestComments: comments,
                drivingTestResult: accept ? "Eligible" : "Not-Eligible",
                drivingTestDate: DateTime.now().toString(),
                drivingAttempts: (user.drivingAttempts ?? 0) + 1,
                userType: accept
                    ? AllStrings.pickupPaymentType
                    : AllStrings.fieldType)
            .toJson());
  }

  Future<void> updatePickupPaymentRelevanceForUser(
      {required UserModel user, required String txid}) async {
    await firestore.collection(AllStrings.userCollection).doc(user.id).update(
        user
            .copyWith(
                licensePaymentStatus: "Waiting for approval",
                licensePaymentUpdatedOn: DateTime.now().toString(),
                licensePaymentTxID: txid)
            .toJson());
  }

  Future<void> updatePickupPaymentRelevanceForAdmin(
      {required UserModel user,
      required bool accept,
      required String declineReason}) async {
    await firestore.collection(AllStrings.userCollection).doc(user.id).update(
        user
            .copyWith(
                licensePaymentStatus: accept ? "Accepted" : "$declineReason",
                licensePaymentUpdatedOn: DateTime.now().toString(),
                licensePaymentUpdatedBy: "${adminCntr.admin!.value.name}",
                userType: accept
                    ? AllStrings.pickupType
                    : AllStrings.pickupPaymentType)
            .toJson());
  }

  Future<void> updatePickupRelevance(
      {required UserModel user,
      required bool accept,
      required String comments}) async {
    await firestore
        .collection(AllStrings.userCollection)
        .doc(user.id)
        .update(user
            .copyWith(
              licenseApproval: "Approved",
              licensePickupDate: comments,
              licenseAssignedOn: DateTime.now().toString(),
            )
            .toJson());
    snackbar("Submitted", "");
    return;
  }
}
