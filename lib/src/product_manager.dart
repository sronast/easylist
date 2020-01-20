import 'package:flutter/material.dart';

import './product_controller.dart';

class ProductManager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  final List<Map<String, dynamic>> _products = [];

  void _addProduct(Map<String, dynamic> p) {
    setState(() {
      _products.add(p);
      print(_products);
    });
  }

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            margin: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            child: ProductController(_addProduct)),
        // Expanded(child: ,)
      ],
    );
  }
}
