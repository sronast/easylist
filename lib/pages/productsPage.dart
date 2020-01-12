import 'package:flutter/material.dart';

import '../src/product_manager.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 120.0,
              child: DrawerHeader(
                child: Text(
                  'Drawer Header',
                  style: TextStyle(color: Colors.white, fontSize: 30.0),
                ),
                decoration: BoxDecoration(
                  color: Colors.black54,
                ),
              ),
            ),
            ListTile(
              title: Text('ManageProduct'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Add Product'),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Your Products List'),
      ),
      body: ProductManager(),
    );
  }
}
