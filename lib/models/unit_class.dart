import 'package:mystrath/models/group.dart';
import 'package:mystrath/models/lecturer.dart';
import 'package:mystrath/models/lesson.dart';
import 'package:mystrath/models/unit.dart';

class UnitClass {
  Unit unit;
  String id;
  Group group;
  Lecturer lecturer;
  List<Lesson> lessons;

  UnitClass({
    required this.unit,
    required this.id,
    required this.group,
    List<Lesson>? lessons,
    required this.lecturer,
  }) : lessons = lessons ?? [];

  Map<String, dynamic> toJson() {
    return {
      'unit': unit.toJson(), // Assuming Unit class has a toJson method
      'id': id,
      'lecturer': lecturer.toJson(), // Assuming Lecturer class has a toJson method
    };
  }

  // Create UnitClass instance from JSON
  factory UnitClass.fromJson(Map<String, dynamic> json) {
    return UnitClass(
      unit: Unit.fromJson(json['unit']), // Assuming Unit class has a fromJson method
      id: json['id'],
      group: Group.fromJson(json['group']), // Assuming Group class has a fromJson method
      lecturer: Lecturer.fromJson(json['lecturer']), // Assuming Lecturer class has a fromJson method
      lessons: (json['lessons'] as List).map((lesson) => Lesson.fromJson(lesson)).toList(), // Assuming Lesson class has a fromJson method
    );
  }
}
