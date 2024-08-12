import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo/Home_screen.dart';
import 'package:todo/My_Theme_app_data.dart';
import 'package:todo/splach_screen.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:MyThemeAppData.ligthTheme,
      initialRoute: '/SpalchScreen',
      routes: {
      '/HomeScreen': (context) => HomeScreen(),
      '/SpalchScreen': (context) => SpalchScreen(),
    },
    );
  }
}


