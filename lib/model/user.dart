// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String? id;
  String? name;
  String? email;
  String? licenseNo;
  String? fatherOrhusbandName;
  String? dateOfBirth;
  String? cnic;
  String? address;
  String? district;
  String? gender;
  String? contactNo;
  String? religion;
  String? martialStatus;
  String? licenseCategory;
  String? endLicenseCategory;
  String? dOI;
  String? bloodGroup;
  String? validUpTo;
  String? userType;
  String? formComments;
  String? formStatus;
  String? formApprovedBy;
  String? formApprovedOn;
  String? appliedOn;
  String? medicalResult;
  String? medicalResultGivenBy;
  String? medicalResultDeclaredOn;
  String? medicalComments;
  int? mediacalAttempts;
  String? quizTrainingStatus;
  String? quizResultDate;
  String? quizResult;
  String? quizResultStatus;
  int? quizAttempts;
  String? drivingTestDate;
  int? drivingAttempts;
  String? drivingTestMonitor;
  String? drivingTestResult;
  String? drivingTestComments;
  String? licenseApproval;
  String? licensePickupDate;
  String? licensePickupLocation;
  String? licenseAssignedOn;
  String? licenseGivenBy;
  String? userConcent;
  String? profilePictureUrl;
  String? idFrontUrl;
  String? idBackUrl;
  String? medicalPaymentStatus;
  String? medicalPaymentUpdatedBy;
  String? medicalPaymentUpdatedOn;
  String? fieldTestPaymentStatus;
  String? fieldTestPaymentUpdatedBy;
  String? fieldTestPaymentUpdatedOn;
  String? licensePaymentStatus;
  String? licensePaymentUpdatedBy;
  String? licensePaymentUpdatedOn;
  String? medicalPaymentTxID;
  String? fieldTestPaymentTxID;
  String? licensePaymentTxID;
  UserModel({
    this.id,
    this.name = "N/A",
    this.email = "N/A",
    this.licenseNo = "N/A",
    this.fatherOrhusbandName = "N/A",
    this.dateOfBirth = "N/A",
    this.cnic = "N/A",
    this.address = "N/A",
    this.district = "N/A",
    this.gender = "N/A",
    this.contactNo = "N/A",
    this.religion = "N/A",
    this.martialStatus = "N/A",
    this.licenseCategory = "N/A",
    this.endLicenseCategory = "N/A",
    this.dOI = "N/A",
    this.bloodGroup = "N/A",
    this.validUpTo = "N/A",
    this.userType = "N/A",
    this.formComments = "N/A",
    this.formStatus = "N/A",
    this.formApprovedBy = "N/A",
    this.formApprovedOn = "N/A",
    this.appliedOn = "N/A",
    this.medicalResult = "N/A",
    this.medicalResultGivenBy = "N/A",
    this.medicalResultDeclaredOn = "N/A",
    this.medicalComments = "N/A",
    this.mediacalAttempts = 0,
    this.quizTrainingStatus = "N/A",
    this.quizResultDate = "N/A",
    this.quizResult = "N/A",
    this.quizResultStatus = "N/A",
    this.quizAttempts = 0,
    this.drivingTestDate = "N/A",
    this.drivingAttempts = 0,
    this.drivingTestMonitor = "N/A",
    this.drivingTestResult = "N/A",
    this.drivingTestComments = "N/A",
    this.licenseApproval = "N/A",
    this.licensePickupDate = "N/A",
    this.licensePickupLocation = "N/A",
    this.licenseAssignedOn = "N/A",
    this.licenseGivenBy = "N/A",
    this.userConcent = "N/A",
    this.profilePictureUrl = "N/A",
    this.idFrontUrl = "N/A",
    this.idBackUrl = "N/A",
    this.medicalPaymentStatus = "N/A",
    this.medicalPaymentUpdatedBy = "N/A",
    this.medicalPaymentUpdatedOn = "N/A",
    this.fieldTestPaymentStatus = "N/A",
    this.fieldTestPaymentUpdatedBy = "N/A",
    this.fieldTestPaymentUpdatedOn = "N/A",
    this.licensePaymentStatus = "N/A",
    this.licensePaymentUpdatedBy = "N/A",
    this.licensePaymentUpdatedOn = "N/A",
    this.medicalPaymentTxID = "N/A",
    this.fieldTestPaymentTxID = "N/A",
    this.licensePaymentTxID = "N/A",
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    licenseNo = json['licenseNo'];
    fatherOrhusbandName = json['fatherOrhusbandName'];
    dateOfBirth = json['dateOfBirth'];
    cnic = json['cnic'];
    address = json['address'];
    district = json['district'];
    gender = json['gender'];
    contactNo = json['contactNo'];
    religion = json['religion'];
    martialStatus = json['martialStatus'];
    licenseCategory = json['licenseCategory'];
    endLicenseCategory = json['EndLicenseCategory'];
    dOI = json['DOI'];
    bloodGroup = json['bloodGroup'];
    validUpTo = json['validUpTo'];
    userType = json['userType'];
    formComments = json['formComments'];
    formStatus = json['formStatus'];
    formApprovedBy = json['formApprovedBy'];
    formApprovedOn = json['formApprovedOn'];
    appliedOn = json['appliedOn'];
    medicalResult = json['medicalResult'];
    medicalResultGivenBy = json['medicalResultGivenBy'];
    medicalResultDeclaredOn = json['medicalResultDeclaredOn'];
    medicalComments = json['medicalComments'];
    mediacalAttempts = json['mediacalAttempts'];
    quizTrainingStatus = json['quizTrainingStatus'];
    quizResultDate = json['quizResultDate'];
    quizResult = json['quizResult'];
    quizResultStatus = json['quizResultStatus'];
    quizAttempts = json['quizAttempts'];
    drivingTestDate = json['drivingTestDate'];
    drivingAttempts = json['drivingAttempts'];
    drivingTestMonitor = json['drivingTestMonitor'];
    drivingTestResult = json['drivingTestResult'];
    drivingTestComments = json['drivingTestComments'];
    licenseApproval = json['licenseApproval'];
    licensePickupDate = json['licensePickupDate'];
    licensePickupLocation = json['licensePickupLocation'];
    licenseAssignedOn = json['licenseAssignedOn'];
    licenseGivenBy = json['licenseGivenBy'];
    userConcent = json['userConcent'];
    profilePictureUrl = json['profilePictureUrl'];
    idFrontUrl = json['idFrontUrl'];
    idBackUrl = json['idBackUrl'];
    medicalPaymentStatus = json['medicalPaymentStatus'];
    medicalPaymentUpdatedBy = json['medicalPaymentUpdatedBy'];
    medicalPaymentUpdatedOn = json['medicalPaymentUpdatedOn'];
    fieldTestPaymentStatus = json['fieldTestPaymentStatus'];
    fieldTestPaymentUpdatedBy = json['fieldTestPaymentUpdatedBy'];
    fieldTestPaymentUpdatedOn = json['fieldTestPaymentUpdatedOn'];
    licensePaymentStatus = json['licensePaymentStatus'];
    licensePaymentUpdatedBy = json['licensePaymentUpdatedBy'];
    licensePaymentUpdatedOn = json['licensePaymentUpdatedOn'];
    medicalPaymentTxID = json['medicalPaymentTxID'];
    fieldTestPaymentTxID = json['fieldTestPaymentTxID'];
    licensePaymentTxID = json['licensePaymentTxID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id; //app at registration
    data['name'] = this.name; //user signup
    data['email'] = this.email; //user signup
    data['licenseNo'] = this.licenseNo; //uid (app at registration)
    data['fatherOrhusbandName'] = this.fatherOrhusbandName; //user
    data['dateOfBirth'] = this.dateOfBirth; //user
    data['cnic'] = this.cnic; //user
    data['address'] = this.address; //user
    data['district'] = this.district; //user
    data['gender'] = this.gender; //user
    data['contactNo'] = this.contactNo; //user
    data['religion'] = this.religion; //user
    data['martialStatus'] = this.martialStatus; //user
    data['licenseCategory'] = this.licenseCategory; //user
    data['EndLicenseCategory'] = this.endLicenseCategory; //user
    data['DOI'] = this.dOI; //user
    data['bloodGroup'] = this.bloodGroup; //user
    data['validUpTo'] = this.validUpTo; //app at end of license pickup
    data['userType'] = this.userType; // varies time to time
    //app - traffic admin
    data['formComments'] = this.formComments; 
    data['formStatus'] = this.formStatus; 
    data['formApprovedBy'] = this.formApprovedBy; 
    data['formApprovedOn'] = this.formApprovedOn; 
    data['appliedOn'] = this.appliedOn; //app - at registration
    //app - medical admin
    data['medicalResult'] = this.medicalResult; 
    data['medicalResultGivenBy'] =
        this.medicalResultGivenBy; 
    data['medicalResultDeclaredOn'] =
        this.medicalResultDeclaredOn; 
    data['medicalComments'] = this.medicalComments; 
    data['mediacalAttempts'] = this.mediacalAttempts; 
    data['quizTrainingStatus'] =
        this.quizTrainingStatus; //app after completing training
    //app after submitting quiz
    data['quizResultDate'] = this.quizResultDate;
    data['quizResult'] = this.quizResult;
    data['quizResultStatus'] = this.quizResultStatus;
    data['quizAttempts'] = this.quizAttempts; //increment

    //app - traffic  admin at office
    data['licenseApproval'] = this.licenseApproval;
    //app - traffic  admin at field
    data['licensePickupDate'] = this.licensePickupDate;
    data['licensePickupLocation'] = this.licensePickupLocation;
    data['licenseAssignedOn'] = this.licenseAssignedOn;
    data['licenseGivenBy'] = this.licenseGivenBy;
    //
    data['drivingTestDate'] = this.drivingTestDate;
    data['drivingAttempts'] = this.drivingAttempts; //increment
    data['drivingTestMonitor'] = this.drivingTestMonitor;
    data['drivingTestResult'] = this.drivingTestResult;
    data['drivingTestComments'] = this.drivingTestComments;
    data['userConcent'] = this.userConcent; //deprecated
    //user when submit doc
    data['profilePictureUrl'] = this.profilePictureUrl;
    data['idFrontUrl'] = this.idFrontUrl;
    data['idBackUrl'] = this.idBackUrl;
    ////app - traffic  admin at office
    data['medicalPaymentStatus'] = this.medicalPaymentStatus;
    data['medicalPaymentUpdatedBy'] = this.medicalPaymentUpdatedBy;
    data['medicalPaymentUpdatedOn'] = this.medicalPaymentUpdatedOn;
    data['fieldTestPaymentStatus'] = this.fieldTestPaymentStatus;
    data['fieldTestPaymentUpdatedBy'] = this.fieldTestPaymentUpdatedBy;
    data['fieldTestPaymentUpdatedOn'] = this.fieldTestPaymentUpdatedOn;
    data['licensePaymentStatus'] = this.licensePaymentStatus;
    data['licensePaymentUpdatedBy'] = this.licensePaymentUpdatedBy;
    data['licensePaymentUpdatedOn'] = this.licensePaymentUpdatedOn;
    //user on specific stage
    data['medicalPaymentTxID'] = this.medicalPaymentTxID;
    data['fieldTestPaymentTxID'] = this.fieldTestPaymentTxID;
    data['licensePaymentTxID'] = this.licensePaymentTxID;
    return data;
  }

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? licenseNo,
    String? fatherOrhusbandName,
    String? dateOfBirth,
    String? cnic,
    String? address,
    String? district,
    String? gender,
    String? contactNo,
    String? religion,
    String? martialStatus,
    String? licenseCategory,
    String? endLicenseCategory,
    String? dOI,
    String? bloodGroup,
    String? validUpTo,
    String? userType,
    String? formComments,
    String? formStatus,
    String? formApprovedBy,
    String? formApprovedOn,
    String? appliedOn,
    String? medicalResult,
    String? medicalResultGivenBy,
    String? medicalResultDeclaredOn,
    String? medicalComments,
    int? mediacalAttempts,
    String? quizTrainingStatus,
    String? quizResultDate,
    String? quizResult,
    String? quizResultStatus,
    int? quizAttempts,
    String? drivingTestDate,
    int? drivingAttempts,
    String? drivingTestMonitor,
    String? drivingTestResult,
    String? drivingTestComments,
    String? licenseApproval,
    String? licensePickupDate,
    String? licensePickupLocation,
    String? licenseAssignedOn,
    String? licenseGivenBy,
    String? userConcent,
    String? profilePictureUrl,
    String? idFrontUrl,
    String? idBackUrl,
    String? medicalPaymentStatus,
    String? medicalPaymentUpdatedBy,
    String? medicalPaymentUpdatedOn,
    String? fieldTestPaymentStatus,
    String? fieldTestPaymentUpdatedBy,
    String? fieldTestPaymentUpdatedOn,
    String? licensePaymentStatus,
    String? licensePaymentUpdatedBy,
    String? licensePaymentUpdatedOn,
    String? medicalPaymentTxID,
    String? fieldTestPaymentTxID,
    String? licensePaymentTxID,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      licenseNo: licenseNo ?? this.licenseNo,
      fatherOrhusbandName: fatherOrhusbandName ?? this.fatherOrhusbandName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      cnic: cnic ?? this.cnic,
      address: address ?? this.address,
      district: district ?? this.district,
      gender: gender ?? this.gender,
      contactNo: contactNo ?? this.contactNo,
      religion: religion ?? this.religion,
      martialStatus: martialStatus ?? this.martialStatus,
      licenseCategory: licenseCategory ?? this.licenseCategory,
      endLicenseCategory: endLicenseCategory ?? this.endLicenseCategory,
      dOI: dOI ?? this.dOI,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      validUpTo: validUpTo ?? this.validUpTo,
      userType: userType ?? this.userType,
      formComments: formComments ?? this.formComments,
      formStatus: formStatus ?? this.formStatus,
      formApprovedBy: formApprovedBy ?? this.formApprovedBy,
      formApprovedOn: formApprovedOn ?? this.formApprovedOn,
      appliedOn: appliedOn ?? this.appliedOn,
      medicalResult: medicalResult ?? this.medicalResult,
      medicalResultGivenBy: medicalResultGivenBy ?? this.medicalResultGivenBy,
      medicalResultDeclaredOn: medicalResultDeclaredOn ?? this.medicalResultDeclaredOn,
      medicalComments: medicalComments ?? this.medicalComments,
      mediacalAttempts: mediacalAttempts ?? this.mediacalAttempts,
      quizTrainingStatus: quizTrainingStatus ?? this.quizTrainingStatus,
      quizResultDate: quizResultDate ?? this.quizResultDate,
      quizResult: quizResult ?? this.quizResult,
      quizResultStatus: quizResultStatus ?? this.quizResultStatus,
      quizAttempts: quizAttempts ?? this.quizAttempts,
      drivingTestDate: drivingTestDate ?? this.drivingTestDate,
      drivingAttempts: drivingAttempts ?? this.drivingAttempts,
      drivingTestMonitor: drivingTestMonitor ?? this.drivingTestMonitor,
      drivingTestResult: drivingTestResult ?? this.drivingTestResult,
      drivingTestComments: drivingTestComments ?? this.drivingTestComments,
      licenseApproval: licenseApproval ?? this.licenseApproval,
      licensePickupDate: licensePickupDate ?? this.licensePickupDate,
      licensePickupLocation: licensePickupLocation ?? this.licensePickupLocation,
      licenseAssignedOn: licenseAssignedOn ?? this.licenseAssignedOn,
      licenseGivenBy: licenseGivenBy ?? this.licenseGivenBy,
      userConcent: userConcent ?? this.userConcent,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
      idFrontUrl: idFrontUrl ?? this.idFrontUrl,
      idBackUrl: idBackUrl ?? this.idBackUrl,
      medicalPaymentStatus: medicalPaymentStatus ?? this.medicalPaymentStatus,
      medicalPaymentUpdatedBy: medicalPaymentUpdatedBy ?? this.medicalPaymentUpdatedBy,
      medicalPaymentUpdatedOn: medicalPaymentUpdatedOn ?? this.medicalPaymentUpdatedOn,
      fieldTestPaymentStatus: fieldTestPaymentStatus ?? this.fieldTestPaymentStatus,
      fieldTestPaymentUpdatedBy: fieldTestPaymentUpdatedBy ?? this.fieldTestPaymentUpdatedBy,
      fieldTestPaymentUpdatedOn: fieldTestPaymentUpdatedOn ?? this.fieldTestPaymentUpdatedOn,
      licensePaymentStatus: licensePaymentStatus ?? this.licensePaymentStatus,
      licensePaymentUpdatedBy: licensePaymentUpdatedBy ?? this.licensePaymentUpdatedBy,
      licensePaymentUpdatedOn: licensePaymentUpdatedOn ?? this.licensePaymentUpdatedOn,
      medicalPaymentTxID: medicalPaymentTxID ?? this.medicalPaymentTxID,
      fieldTestPaymentTxID: fieldTestPaymentTxID ?? this.fieldTestPaymentTxID,
      licensePaymentTxID: licensePaymentTxID ?? this.licensePaymentTxID,
    );
  }
}
