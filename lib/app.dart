import 'package:easylist/pages/home.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.green, accentColor: Colors.pinkAccent),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
