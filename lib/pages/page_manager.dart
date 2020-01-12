import 'package:flutter/material.dart';

import './auth.dart';

class PageManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      theme:
          ThemeData(primarySwatch: Colors.green, accentColor: Colors.redAccent),
      home: AuthPage(),
      debugShowCheckedModeBanner: false,
    ));
  }
}
