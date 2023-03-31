import "dart:ffi";

class Halls {
  final String id;
  final String name;
  final Int capacity;
  final Bool status;
  final String building;
  final String school;

  Halls(
      {required this.id,
      required this.name,
      required this.capacity,
      required this.status,
      required this.building,
      required this.school});

  factory Halls.fromJson(Map<String, dynamic> json) {
    return Halls(
        id: json['id'],
        name: json['name'],
        capacity: json['capacity'],
        status: json['status'],
        building: json['building'],
        school: json['school']);
  }
}
