import 'package:cuk/splash_screen/splash_screen.dart';
import 'package:cuk/user_list/user_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(




        primarySwatch: Colors.blue,
      ),
      home: splash_screen(),
    );
  }
}



