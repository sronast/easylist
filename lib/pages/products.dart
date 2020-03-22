import 'package:flutter/material.dart';

import '../src/product_manager.dart';

class ProductsPage extends StatelessWidget {
  final List<Map<String, dynamic>> _products;
  // final Function _addProduct;
  // final Function _deleteProduct;

  ProductsPage(this._products);

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('Select'),
            ),
            ListTile(
              title: Text('Manage Products'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/admin');
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('EasyList'),
      ),
      body: ProductManager(_products),
    );
  }
}
