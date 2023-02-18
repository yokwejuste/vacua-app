import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

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
}
