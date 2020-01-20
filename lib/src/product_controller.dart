import 'package:flutter/material.dart';

class ProductController extends StatelessWidget {
  final Function addProduct;
  ProductController(this.addProduct);

  Widget build(context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      child: Text('Add Products'),
      onPressed: () {
        addProduct({'name': 'Fruits', 'path': 'assets/fruit.png'});
      },
    );
  }
}
