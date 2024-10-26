import 'package:mystrath/models/Student.dart';
import 'package:mystrath/models/course.dart';

class Group {
  String name;
  String id;
  List<Student> students;
  Course course;

  Group({
    required this.name,
    required this.id,
    this.students = const [],
    required this.course,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      name: json['name'],
      id: json['id'],
      students: json['students'],
      course: json['course'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'students': students,
      'course': course,
    };
  }
}
