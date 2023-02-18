import 'dart:ffi' show Bool;

import 'package:cloud_firestore/cloud_firestore.dart';

class Reservations {
  late String reservationId;
  late String courseDescription;
  late String courseCode;
  late String courseTitle;
  late String lecturer;
  late Timestamp reservationDate;
  late Timestamp startTime;
  late Timestamp endTime;
  late String userId;
  late Bool isComplete;
  late Timestamp createdAt;


  Reservations({
    required this.reservationId,
    required this.courseCode,
    required this.courseTitle,
    required this.lecturer,
    required this.reservationDate,
    required this.startTime,
    required this.endTime,
    required this.userId,
    required this.isComplete,

    courseDescription,
  });
}
