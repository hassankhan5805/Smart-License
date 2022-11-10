import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartlicense/model/type.dart';

class AdminModel {
  String? uid;
  String? name;
  String? email;
  Timestamp? registeredOn;
  String? designation;
  String? appliedFor;
  String? type;
  String? approvedBy;
  String? approvedOn;
  UserType? userType;

  AdminModel(
      {this.uid,this.name,
      this.email,
      this.registeredOn,
      this.designation,
      this.appliedFor,
      this.type,
      this.approvedBy,
      this.approvedOn,
      this.userType});

  AdminModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    email = json['email'];
    registeredOn = json['registeredOn'];
    designation = json['designation'];
    appliedFor = json['appliedFor'];
    type = json['userType'];
    approvedBy = json['approvedBy'];
    approvedOn = json['approvedOn'];
    userType = UserType().instance(json['userType']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['email'] = this.email;
    data['registeredOn'] = this.registeredOn;
    data['designation'] = this.designation;
    data['appliedFor'] = this.appliedFor;
    data['userType'] = this.type;
    data['approvedBy'] = this.approvedBy;
    data['approvedOn'] = this.approvedOn;
    return data;
  }
}
