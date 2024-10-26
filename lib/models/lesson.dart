import 'package:mystrath/models/Student.dart';
import 'package:mystrath/models/unit_class.dart';

class Lesson {
  DateTime lessonStart;
  int duration; //in hours
  UnitClass unitClass;
  String id;
  List<Student> attendingStudents;
  int linkBufferTime; //in minutes

  Lesson(
      {required this.lessonStart,
      required this.duration,
      required this.unitClass,
      required this.id,
      required this.attendingStudents,
      required this.linkBufferTime});

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      lessonStart: DateTime.parse(json['lessonStart']),
      duration: json['duration'],
      unitClass: UnitClass.fromJson(json['unitClass']),
      id: json['id'],
      attendingStudents: (json['attendingStudents'] as List<dynamic>)
          .map((student) => Student.fromJson(student))
          .toList(),
      linkBufferTime: json['linkBufferTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lessonStart': lessonStart.toIso8601String(),
      'duration': duration,
      'unitClass': unitClass.toJson(),
      'id': id,
      'attendingStudents': attendingStudents.map((student) => student.toJson()).toList(),
      'linkBufferTime': linkBufferTime,
    };
  }
}
