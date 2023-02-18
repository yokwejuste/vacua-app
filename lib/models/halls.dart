import "dart:ffi";

import "package:cloud_firestore/cloud_firestore.dart";

class Halls {
  late String hallName;
  late String hallId;
  late String capacity;
  late String longitude;
  late String latitude;
  late String school;
  late Bool isAvailable;
  late Timestamp createdAt;
  late String gMapLink;
  late String building;
  late String createdBy;

  Halls({
    required this.hallName,
    required this.hallId,
    required this.capacity,
    required this.longitude,
    required this.latitude,
    required this.school,
    required this.isAvailable,
    required this.createdAt,
    required this.gMapLink,
    required this.building,
    required this.createdBy,
  });
}
