import 'package:flutter/material.dart';
import 'package:todo/colors_app.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({super.key});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12,right: 12,top: 5,bottom: 10),
      child: Container(

        decoration: BoxDecoration(
            color: app_colors.white,
            borderRadius: BorderRadiusDirectional.circular(25)),
        width: double.infinity,
        height: 120,
        child: Slidable(
          startActionPane: ActionPane(
            motion:  DrawerMotion(),
            extentRatio: .6,
            children:[
              SlidableAction(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(25),bottomLeft: Radius.circular(25)),
                onPressed: (context) {},
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
              SlidableAction(
                onPressed: (context) {},
                backgroundColor: app_colors.blue,
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
              ),
            ],
          ),

          child: Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 62,
                  decoration: BoxDecoration(
                      color: app_colors.blue,
                      borderRadius: BorderRadius.circular(25)),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      " Text title ",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: app_colors.blue),
                    ),
                    Text(
                      " Text description ",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: app_colors.black),
                    ),
                  ],
                ),
                Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: app_colors.blue, // background color

                    elevation: 0, // remove shadow
                    padding: EdgeInsets.all(8), // adjust padding
                  ),
                  onPressed: () {},
                  child: Icon(
                    Icons.done_outline_outlined,
                    color: app_colors.white, // icon color
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
