import 'package:mystrath/models/course.dart';
import 'package:mystrath/models/unit_class.dart';

class Student {
  Course course;
  List<UnitClass>? classes;
  String email;
  String name;
  String imageUrl;
  int id;

  Student({
    required this.course,
    this.classes,
    required this.email,
    required this.name,
    required this.imageUrl,
    required this.id,
  });

  // Convert Student instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'course': course.toJson(),
      'classes': classes?.map((e) => e.toJson()).toList(),
      'email': email,
      'name': name,
      'imageUrl': imageUrl,
      'id': id,
    };
  }

  // Create Student instance from JSON
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      course: Course.fromJson(json['course']),
      classes: (json['classes'] as List).map((e) => UnitClass.fromJson(e)).toList(),
      email: json['email'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      id: json['id'],
    );
  }



}
