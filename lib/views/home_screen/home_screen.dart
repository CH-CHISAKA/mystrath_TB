import 'package:flutter/material.dart';
import 'package:mystrath/views/home_screen/main_home_screen.dart';

class HomeScreen extends StatelessWidget {
  final MainHomeScreenState parentState;

  HomeScreen({super.key, required this.parentState,});

  final List<Map<String, dynamic>> items = [
    {'icon': Icons.book, 'label': 'Coursework'},
    {'icon': Icons.school, 'label': 'Attendance'},
    {'icon': Icons.attach_money, 'label': 'Fees'},
    {'icon': Icons.calendar_today, 'label': 'Timetable'},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text('Welcome ${parentState.student.name}'),
        //const BannerWidgetCarousel(),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Handle item tap
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(items[index]['icon'], color: Colors.white, size: 48),
                      SizedBox(height: 10),
                      Text(items[index]['label'], style: TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ]),
    );
  }
}
