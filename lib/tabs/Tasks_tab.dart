import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo/colors_app.dart';

import '../TaskCard.dart';

class Tasks_tab extends StatelessWidget {
  const Tasks_tab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) => print(date),
            leftMargin: 80,
            monthColor: app_colors.black,
            dayColor: app_colors.blue,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: app_colors.blue,
            dotColor: app_colors.white,
            locale: 'en',
          ),
          Expanded(

            child: ListView.builder(
              itemBuilder: (context, index) {
                return TaskCard();
              },
              itemCount: 30,
            ),
          )
        ],
      ),
    );
  }
}
