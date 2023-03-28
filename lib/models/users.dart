import "package:flutter/foundation.dart";

class UserModel {
  late String username;
  late String phone;
  late String name;
  late String department;
  late String type;
  late int level;
  late String gender;
  late String school;
  late DateTime createdAt;
  late DateTime dateOfBirth;
  late String whatsappGroup;
  late String createdBy;

  UserModel({
    required this.username,
    required this.phone,
    required this.name,
    required this.department,
    required this.type,
    required this.level,
    required this.gender,
    required this.school,
    required this.createdAt,
    required this.dateOfBirth,
    required this.createdBy,
    whatsappGroup,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      phone: json['phone'],
      name: json['name'],
      department: json['department'],
      type: json['type'],
      school: json['school'],
      gender: json['gender'],
      level: json['level'],
      createdAt: json['created_at'],
      dateOfBirth: json['date_of_birth'],
      createdBy: json['created_by'],
      whatsappGroup: json['whatsapp_group'],
    );
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'phone': phone,
        'name': name,
        'department': department,
        'type': type,
        'school': school,
        'gender': gender,
        'level': level,
        "createdAt": createdAt,
        "createdBy": createdBy,
        "whatsappGroup": whatsappGroup
      };

  static bool validateEmail(String email) {
    RegExp regex = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    if (email.isEmpty || !regex.hasMatch(email)) {
      return false;
    }
    return true;
  }
}
