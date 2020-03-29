import 'package:easylist/pages/auth.dart';
import 'package:easylist/pages/product.dart';
import 'package:easylist/pages/products.dart';
import 'package:flutter/material.dart';
import 'pages/products_admin.dart';

class MyApp extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final List<Map<String, dynamic>> _products = [];

  void _addProduct(Map<String, dynamic> p) {
    setState(() {
      _products.add(p);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  void _updateProduct(Map<String, dynamic> p, int index) {
    setState(() {
      _products[index] = p;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.blueGrey,
          buttonColor: Colors.blueGrey),
      home: AuthPage(),
      debugShowCheckedModeBanner: false,
      //named routes
      routes: {
        '/products': (BuildContext context) => ProductsPage(
              _products,
            ),
        '/admin': (BuildContext context) => ProductAdminPage(
            _addProduct, _deleteProduct, _products, _updateProduct)
      },
      //routes with data
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');

        if (pathElements[0] != '') {
          return null;
        }

        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
              builder: (BuildContext context) => ProductPage(_products[index]));
        }

        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => ProductsPage(_products));
      },
    );
  }
}
