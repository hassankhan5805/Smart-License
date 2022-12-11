import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:smartlicense/constants/strings.dart';
import 'package:smartlicense/controllers/admin_controller.dart';
import 'package:smartlicense/model/user.dart';
import 'package:smartlicense/services/authentication.dart';
import 'package:smartlicense/views/admin/medical/medical_admin.dart';
import 'package:smartlicense/views/admin/super/super_admin.dart';
import 'package:smartlicense/views/admin/traffic/traffic_admin.dart';
import 'package:smartlicense/views/admin/waiting.dart';
import 'package:smartlicense/views/user/form_registration.dart';

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

    switch (type) {
      case AllStrings.registrationType:
        Get.offAll(() => FormRegistration());
        break;
      case AllStrings.regWaitingType:
        Get.offAll(() => WaitingRoom());
        break;
      case AllStrings.medicalType:
        Get.offAll(() => FormRegistration());
        break;
      case AllStrings.quizTrainingType:
        // Get.offAll(() => QuizTraining());
        break;
      case AllStrings.quizType:
        // Get.offAll(() => Quiz());
        break;
      case AllStrings.fieldType:
        Get.offAll(() => FormRegistration());
        break;
      case AllStrings.pickupType:
        Get.offAll(() => FormRegistration());
        break;
      case AllStrings.trafficAdminType:
        Get.offAll(() => TrafficAdmin());
        break;
      case AllStrings.fieldPaymentType:
        // Get.offAll(() => paywall());
        break;
      case AllStrings.pickupPaymentType:
        // Get.offAll(() => paywall());
        break;
      case AllStrings.medicalPaymentType:
        Get.offAll(() => WaitingRoom());

        // Get.offAll(() => paywall());
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
        Get.offAll(() => FormRegistration());
        break;
      default:
        Authentication().signOut();
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

  Future<void> updateMedicalRelevance(UserModel user, bool accept,
      {String formComments = ""}) async {
    await firestore.collection(AllStrings.userCollection).doc(user.id).update({
      AllStrings.userType: accept
          ? AllStrings.quizTrainingType
          : AllStrings.permanentlyRejectedType,
      AllStrings.medicalResultGivenBy: "${adminCntr.admin!.value.name}",
      AllStrings.medicalComments: formComments,
      AllStrings.medicalResult: accept,
      AllStrings.medicalResultDeclaredOn: DateTime.now().toString(),
    });
  }

  //   Future<void> updateMedicalPaymentRelevance(UserModel user, bool accept,
  //     {String formComments = ""}) async {
  //   await firestore.collection(AllStrings.userCollection).doc(user.id).update({
  //     AllStrings.userType:
  //         accept ? AllStrings.medicalType : AllStrings.registrationType,
  //     AllStrings.formApprovedBy: "${adminCntr.admin!.value.name}",
  //     AllStrings.formComments: formComments,
  //     AllStrings.formStatus: accept,
  //     AllStrings.formApprovedOn: DateTime.now().toString(),
  //   });
  // }
  Future<void> updateQuizRelevance(UserModel user, bool accept,
      {String formComments = ""}) async {
    await firestore.collection(AllStrings.userCollection).doc(user.id).update({
      AllStrings.userType:
          accept ? AllStrings.fieldPaymentType : AllStrings.quizTrainingType,
      AllStrings.quizAttempts: FieldValue.increment(1),
      AllStrings.quizResult: formComments,
      AllStrings.quizResultStatus: accept.toString(),
      AllStrings.quizResultDate: DateTime.now().toString(),
    });
  }

  Future<void> updateQuizTrainingRelevance(UserModel user, bool accept,
      {String formComments = ""}) async {
    await firestore.collection(AllStrings.userCollection).doc(user.id).update({
      AllStrings.userType:
          accept ? AllStrings.quizType : AllStrings.quizTrainingType,
      AllStrings.quizTrainingStatus: "Completed"
    });
  }

  //   Future<void> updateFieldPaymentRelevance(UserModel user, bool accept,
  //     {String formComments = ""}) async {
  //   await firestore.collection(AllStrings.userCollection).doc(user.id).update({
  //     AllStrings.userType:
  //         accept ? AllStrings.medicalType : AllStrings.registrationType,
  //     AllStrings.formApprovedBy: "${adminCntr.admin!.value.name}",
  //     AllStrings.formComments: formComments,
  //     AllStrings.formStatus: accept,
  //     AllStrings.formApprovedOn: DateTime.now().toString(),
  //   });
  // }
  Future<void> updateFieldTestRelevance(UserModel user, bool accept,
      {String formComments = ""}) async {
    await firestore.collection(AllStrings.userCollection).doc(user.id).update({
      AllStrings.userType:
          accept ? AllStrings.pickupPaymentType : AllStrings.fieldPaymentType,
      AllStrings.fieldTestPaymentUpdatedBy: "${adminCntr.admin!.value.name}",
      AllStrings.fieldTestPaymentStatus: formComments + accept.toString(),
      AllStrings.fieldTestPaymentUpdatedOn: DateTime.now().toString(),
    });
  }

  //Waiting pages
  //form registraiton waiting
  //medical payment
  //medical
  //field payment
  //field
  //license payment
  //license pickup
  //permanently rejected
}
