import 'package:flutter/material.dart';
import 'package:todo/TaskModel.dart';
import 'package:todo/colors_app.dart';

import '../firebase_functions.dart';

class Addtaskbottomsheet extends StatefulWidget {
  Addtaskbottomsheet({super.key});

  @override
  State<Addtaskbottomsheet> createState() => _AddtaskbottomsheetState();
}

class _AddtaskbottomsheetState extends State<Addtaskbottomsheet> {
  DateTime _SelectedDate =DateTime.now();
  var titleControler = TextEditingController();
  var subTitleControler = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            " Add New Task ",
            textAlign: TextAlign.center,
            style:
                Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 30),
          ),
          SizedBox(
            height: 14,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: titleControler,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: app_colors.black),
                      decoration: InputDecoration(
                        labelText: " Title ",
                        labelStyle: TextStyle(color: app_colors.blue),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: app_colors.blue),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: app_colors.blue),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            titleControler.clear();
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a title';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    TextFormField(
                      controller: subTitleControler,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: app_colors.black),
                      decoration: InputDecoration(
                        labelText: " description ",
                        labelStyle: TextStyle(color: app_colors.blue),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: app_colors.blue),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: app_colors.blue),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            subTitleControler.clear();
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Row(
                      children: [
                        Text(
                          " Select Time ",
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: app_colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        selectedDate(context);
                      },
                      child: Text(
                        _SelectedDate.toString().substring(0, 10),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: app_colors.blue),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: app_colors.blue,
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Taskmodel task = Taskmodel(
                                  Title: titleControler.text,
                                  SubTitle: subTitleControler.text,
                                  Date: DateUtils.dateOnly(_SelectedDate)
                                      .millisecondsSinceEpoch,
                                );
                                FirebaseFunctions.addTask(task).then((value) {
                                  Navigator.pop(context);
                                });
                              }
                            },
                            child: Text(
                              " Add ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: app_colors.white),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void selectedDate(context) async {
    DateTime? chosenDate = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
                canvasColor: Colors.orange,
              textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.black)),
              colorScheme: ColorScheme.light(
                primary: app_colors.blue,
                onPrimary: app_colors.white,
                onSurface: app_colors.black,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: app_colors.blue, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        initialDate: _SelectedDate,
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chosenDate != null) {
      _SelectedDate = chosenDate;
      setState(() {});
    }
  }
}
