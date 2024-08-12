import 'package:flutter/material.dart';
import 'package:todo/colors_app.dart';

class Addtaskbottomsheet extends StatefulWidget {
  Addtaskbottomsheet({super.key});

  @override
  State<Addtaskbottomsheet> createState() => _AddtaskbottomsheetState();
}

class _AddtaskbottomsheetState extends State<Addtaskbottomsheet> {
  DateTime _SelectedDate = DateTime.now();

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
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: " Title ",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: " description ",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
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
                          onPressed: () {},
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
        ],
      ),
    );
  }
  void selectedDate(context) async{
    DateTime? chosenDate = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: app_colors.blue,
                // header background color
                onPrimary: app_colors.white,
                // header text color
                onSurface:
                app_colors.black, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor:
                  app_colors.blue, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        initialDate: _SelectedDate ,
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chosenDate!= null){
      _SelectedDate = chosenDate ;
      setState(() {

      });
    }

  }

}

