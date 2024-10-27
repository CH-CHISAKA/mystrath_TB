import 'package:flutter/material.dart';
import 'package:mystrath/models/Student.dart';
import 'package:mystrath/controllers/studentController.dart';

class AttendanceScreen extends StatefulWidget {
  final Student student;
  const AttendanceScreen({super.key, required this.student});

  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {

  List<Map<String, dynamic>> attendanceData = [];

  @override
  void initState() {
    super.initState();
    _fetchAttendance();
  }

  void _fetchAttendance() {
    //check for updates to attendance data
    attendanceData = StudentController(student: widget.student).showAttendance();
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
    ));
  }
}
