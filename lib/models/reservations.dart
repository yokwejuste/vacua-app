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

  factory Reservations.fromJson(Map<String, dynamic> json){
    return Reservations(
      reservationId: json['reservation_id'],
      courseCode: json['course_code'],
      courseTitle: json['course_title'],
      lecturer: json['lecturer'],
      reservationDate: json['reservation_date'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      userId: json['user_id'],
      isComplete: json['is_complete'],
      courseDescription: json['course_description'],
    );
  }
}
