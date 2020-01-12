import 'package:flutter/material.dart';

import '../src/product_manager.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('Choose Item'),
            ),
            ListTile(
              title: Text('ManageProduct'),
              onTap: () {},
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
