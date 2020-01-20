import 'package:flutter/material.dart';

import './src/product_manager.dart';

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.green, accentColor: Colors.pinkAccent),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Products Here'),
        ),
        body: ProductManager(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
