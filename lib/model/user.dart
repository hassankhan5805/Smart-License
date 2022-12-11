class UserModel {
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

  UserModel(
      {this.name="",
      this.email="",
      this.licenseNo="",
      this.fatherOrhusbandName="",
      this.dateOfBirth="",
      this.cnic="",
      this.address="",
      this.district="",
      this.gender="",
      this.contactNo="",
      this.religion="",
      this.martialStatus="",
      this.licenseCategory="",
      this.endLicenseCategory="",
      this.dOI="",
      this.bloodGroup="",
      this.validUpTo="",
      this.userType="",
      this.formComments="",
      this.formStatus="",
      this.formApprovedBy="",
      this.formApprovedOn="",
      this.appliedOn="",
      this.medicalResult="",
      this.medicalResultGivenBy="",
      this.medicalResultDeclaredOn="",
      this.medicalComments="",
      this.mediacalAttempts=0,
      this.quizTrainingStatus="",
      this.quizResultDate="",
      this.quizResult="",
      this.quizResultStatus="",
      this.quizAttempts=0,
      this.drivingTestDate="",
      this.drivingAttempts=0,
      this.drivingTestMonitor="",
      this.drivingTestResult="",
      this.drivingTestComments="",
      this.licenseApproval="",
      this.licensePickupDate="",
      this.licensePickupLocation="",
      this.licenseAssignedOn="",
      this.licenseGivenBy="",
      this.userConcent="",
      this.profilePictureUrl="",
      this.idFrontUrl="",
      this.idBackUrl=""});

  UserModel.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['licenseNo'] = this.licenseNo;
    data['fatherOrhusbandName'] = this.fatherOrhusbandName;
    data['dateOfBirth'] = this.dateOfBirth;
    data['cnic'] = this.cnic;
    data['address'] = this.address;
    data['district'] = this.district;
    data['gender'] = this.gender;
    data['contactNo'] = this.contactNo;
    data['religion'] = this.religion;
    data['martialStatus'] = this.martialStatus;
    data['licenseCategory'] = this.licenseCategory;
    data['EndLicenseCategory'] = this.endLicenseCategory;
    data['DOI'] = this.dOI;
    data['bloodGroup'] = this.bloodGroup;
    data['validUpTo'] = this.validUpTo;
    data['userType'] = this.userType;
    data['formComments'] = this.formComments;
    data['formStatus'] = this.formStatus;
    data['formApprovedBy'] = this.formApprovedBy;
    data['formApprovedOn'] = this.formApprovedOn;
    data['appliedOn'] = this.appliedOn;
    data['medicalResult'] = this.medicalResult;
    data['medicalResultGivenBy'] = this.medicalResultGivenBy;
    data['medicalResultDeclaredOn'] = this.medicalResultDeclaredOn;
    data['medicalComments'] = this.medicalComments;
    data['mediacalAttempts'] = this.mediacalAttempts;
    data['quizTrainingStatus'] = this.quizTrainingStatus;
    data['quizResultDate'] = this.quizResultDate;
    data['quizResult'] = this.quizResult;
    data['quizResultStatus'] = this.quizResultStatus;
    data['quizAttempts'] = this.quizAttempts;
    data['drivingTestDate'] = this.drivingTestDate;
    data['drivingAttempts'] = this.drivingAttempts;
    data['drivingTestMonitor'] = this.drivingTestMonitor;
    data['drivingTestResult'] = this.drivingTestResult;
    data['drivingTestComments'] = this.drivingTestComments;
    data['licenseApproval'] = this.licenseApproval;
    data['licensePickupDate'] = this.licensePickupDate;
    data['licensePickupLocation'] = this.licensePickupLocation;
    data['licenseAssignedOn'] = this.licenseAssignedOn;
    data['licenseGivenBy'] = this.licenseGivenBy;
    data['userConcent'] = this.userConcent;
    data['profilePictureUrl'] = this.profilePictureUrl;
    data['idFrontUrl'] = this.idFrontUrl;
    data['idBackUrl'] = this.idBackUrl;
    return data;
  }
}
