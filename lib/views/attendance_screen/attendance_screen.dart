import 'package:flutter/material.dart';
import 'package:mystrath/models/course.dart';
import 'package:mystrath/models/group.dart';
import 'package:mystrath/models/lecturer.dart';
import 'package:mystrath/models/Student.dart';
import 'package:mystrath/models/unit.dart';
import 'package:mystrath/models/unit_class.dart';
import 'package:mystrath/controllers/studentController.dart';

class AttendanceScreen extends StatefulWidget {
  AttendanceScreen({super.key});
  //Dummy Course
  final Course course = Course(
    id: "dummy",
    name: "Bachelor of Business Information Technology",
  );

  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {

  //Dummy Class
  late UnitClass dummyClass;
  late Student _student;
  List<Map<String, dynamic>> attendanceData = [];

  @override
  void initState() {
    super.initState();
    _fetchAttendance();
  }

  void _fetchAttendance() {
    _student = Student(
      course: widget.course,
      classes: [],
      email: 'john.doe@example.com',
      name: 'John Doe',
      imageUrl: 'https://example.com/image.jpg',
      id: 12345,
    );
    dummyClass = UnitClass(
        unit: Unit(name: 'Coding Essentials', code: "BBT1101"),
        id: "dummy",
        group: Group(name: "BBIT 1B", id: "id", course: widget.course),
        lecturer: Lecturer(email: 'example.com', name: 'tom', id: 0001));
    _student.classes?.add(dummyClass);
    attendanceData = StudentController(student: _student).showAttendance();
  }

  void showDetailedAttendance() {
    //Show detailed attendance
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Attendance',
          //TODO: Style to use DisplayLarge from themes.dart
        ),
          ),
          Expanded(
        child: attendanceData.isEmpty
            ? const Center(child: Text('No attendance data available'))
            : ListView.builder(
            itemCount: attendanceData.length,
            itemBuilder: (context, index) {
              return ListTile(
            title: Text(attendanceData[index]['name']),
            onTap: showDetailedAttendance,
            subtitle: Text(
                'Lecturer: ${attendanceData[index]['lecturer']}\nTotal Hours: ${attendanceData[index]['totalTime']} | Hours Absent: ${attendanceData[index]['absentTime']} \nPercentage Absent: ${attendanceData[index]['absentPercentage'].toStringAsFixed(2)}%'),
              );

            },
          ),
          ),
        ],
      )
    );
  }
}
