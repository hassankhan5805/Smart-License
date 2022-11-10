import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartlicense/model/type.dart';

class UserModel {
  String? name;
  String? email;
  Timestamp? registeredOn;
  String? profileImageUrl;
  String? status;
  String? type;
  UserType? userType;

  UserModel(
      {this.name,
      this.email,
      this.registeredOn,
      this.profileImageUrl,
      this.status,
      this.type,
      this.userType});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    registeredOn = json['registeredOn'];
    profileImageUrl = json['profileImageUrl'];
    status = json['status'];
    type = json['userType'];
    userType = UserType().instance(json['userType']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['registeredOn'] = this.registeredOn;
    data['profileImageUrl'] = this.profileImageUrl;
    data['status'] = this.status;
    data['userType'] = this.type;
    return data;
  }
}
