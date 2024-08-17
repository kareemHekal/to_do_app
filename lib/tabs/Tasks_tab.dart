import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo/TaskModel.dart';
import 'package:todo/colors_app.dart';
import 'package:todo/firebase_functions.dart';

import '../TaskCard.dart';
import '../loadingFile/loadingWidget.dart';

class Tasks_tab extends StatefulWidget {
  Tasks_tab({super.key});

  @override
  State<Tasks_tab> createState() => _Tasks_tabState();
}

class _Tasks_tabState extends State<Tasks_tab> {
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: date,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date_time) {
              date = date_time;
              setState(() {});
            },
            leftMargin: 80,
            monthColor: app_colors.black,
            dayColor: app_colors.blue,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: app_colors.blue,
            dotColor: app_colors.white,
            locale: 'en',
          ),
          StreamBuilder(
            stream: FirebaseFunctions.getTasks(date),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: DiscreteCircle(
                  color: app_colors.blue,
                  size: 30,
                  secondCircleColor: app_colors.backGroundColorLigthTheme,
                  thirdCircleColor: Colors.white,
                ));
              }
              if (snapshot.hasError) {
                return Center(
                  child: Column(
                    children: [
                      Text("Something went wrong"),
                      ElevatedButton(onPressed: () {}, child: Text('try again'))
                    ],
                  ),
                );
              }
              var tasks =
                  snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
              if (tasks.isEmpty) {
                return Center(
                    child: Text(
                  "No Tasks",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: app_colors.black),
                ));
              }
              return Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    height: 12,
                  ),
                  itemBuilder: (context, index) {
                    return TaskCard(
                      taskmodel: tasks[index],
                    );
                  },
                  itemCount: tasks.length,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
