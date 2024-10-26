import 'package:mystrath/models/Lesson.dart';
import 'package:mystrath/models/Student.dart';
import 'package:mystrath/models/unit_class.dart';

class StudentController {
  Student student;
  StudentController({required this.student});

  Future<void> getUnits() async {
    //Get units from database
  }

  List<Map<String, dynamic>> showAttendance() {
    List<Map<String, dynamic>> attendanceDetails = [];

    for (UnitClass unitClass in student.classes!) {
      int totalTime = 0;
      int attendedTime = 0;

      // Calculate total and attended time
      for (var lesson in unitClass.lessons) {
        totalTime += lesson.duration;
        if (lesson.attendingStudents.contains(student)) {
          attendedTime += lesson.duration;
        }
      }
      int absentTime = totalTime - attendedTime;
      double absentPercentage = totalTime == 0 ? 100 : absentTime / totalTime;

      // Store class attendance details
      attendanceDetails.add({
        'name': "${unitClass.unit.code} - ${unitClass.unit.name}",
        'lecturer': unitClass.lecturer.name,
        'absentPercentage': absentPercentage,
        'absentTime': absentTime,
        'totalTime': totalTime
      });
    }
    return attendanceDetails;
  }

  String markAttendance(Lesson lesson) {
    //Check if link has expired
    DateTime currentTime = DateTime.now();
    if (currentTime.isAfter(lesson.lessonStart.add(
        Duration(hours: lesson.duration, minutes: lesson.linkBufferTime)))) {
      //link has expired
      return "The attendance code has expired";
    } else {
      //link is still valid
      //check if student is registered in unit
      if (student.classes!.contains(lesson.unitClass)) {
        //Student is registered in unit

        //Update Attendance record
        //check if student in lesson
        if (lesson.attendingStudents.contains(student)) {
          //Student is already in lesson
          return "Attendance for this class was already logged";
        } else {
          //Student is not in lesson
          lesson.attendingStudents.add(student);
          //Update attendance record
          return "Attendance recorded";
        }
      } else {
        //Student is not registered in unit
        return "You are not registered for this Unit";
      }
    }
  }
}
