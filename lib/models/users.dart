import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/foundation.dart";

class User {
  late String userId;
  late String username;
  late String email;
  late String phone;
  late String name;
  late String department;
  late String type;
  late int level;
  late String gender;
  late String school;
  late Timestamp createdAt;
  late Timestamp dateOfBirth;
  late String whatsappGroup;
  late String createdBy;

  User({
    required this.userId,
    required this.username,
    required this.email,
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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'],
      username: json['username'],
      email: json['email'],
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

  static bool validateEmail(String email) {
    RegExp regex = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    if (email.isEmpty || !regex.hasMatch(email)) {
      return false;
    }
    return true;
  }
}
