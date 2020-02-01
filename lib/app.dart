import 'package:easylist/pages/auth.dart';
import 'package:easylist/pages/products.dart';
import 'package:flutter/material.dart';
import 'pages/products_admin.dart';

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green, accentColor: Colors.brown),
      home: AuthPage(),
      debugShowCheckedModeBanner: false,
      //named routes
      routes: {
        '/products': (BuildContext context) => ProductsPage(),
        '/admin': (BuildContext context) => ProductAdminPage()
      },
    );
  }
}
