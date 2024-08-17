import 'package:flutter/material.dart';
import 'package:todo/TaskModel.dart';
import 'package:todo/colors_app.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'firebase_functions.dart';

class TaskCard extends StatelessWidget {
  Taskmodel taskmodel;

  TaskCard({super.key, required this.taskmodel});

  @override
  Widget build(BuildContext context) {
    String subtitle = taskmodel.SubTitle;
    String title = taskmodel.Title;
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 5, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: app_colors.white,
          borderRadius: BorderRadiusDirectional.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // color of the shadow
              spreadRadius: 1, // spread radius of the shadow
              blurRadius: 7, // blur radius of the shadow
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        width: double.infinity,
        height: 120,
        child: Slidable(
          startActionPane: ActionPane(
            motion: DrawerMotion(),
            extentRatio: .6,
            children: [
              SlidableAction(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(25)),
                onPressed: (context) {
                  FirebaseFunctions.deleteTask(taskmodel.id);
                },
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
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 4,
                  height: 62,
                  decoration: BoxDecoration(
                      color: taskmodel.isDone ==false?app_colors.blue:app_colors.green ,
                      borderRadius: BorderRadius.circular(25)),
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$title",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: taskmodel.isDone ==false?app_colors.blue:app_colors.green),
                      ),
                      Container(
                        height: 40, // adjust the height
                        child: Text(
                          "$subtitle",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: app_colors.black),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                taskmodel.isDone ==false?Text("Done !"):
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: taskmodel.isDone ==false?app_colors.blue:app_colors.green ,

                    elevation: 0, // remove shadow
                    padding: EdgeInsets.all(8), // adjust padding
                  ),
                  onPressed: () {
                    taskmodel.isDone = true ;
                    FirebaseFunctions.updateTask(taskmodel);
                  },
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
