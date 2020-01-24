import 'package:easylist/pages/auth.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green, accentColor: Colors.brown),
      home: AuthPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
