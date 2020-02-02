import 'package:flutter/material.dart';

import './product_controller.dart';
import './products.dart';

class ProductManager extends StatelessWidget {
  final List<Map<String, dynamic>> _products;
  final Function _addProduct;
  final Function _deleteProduct;

  ProductManager(this._products, this._addProduct, this._deleteProduct);

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            margin: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            child: ProductController(_addProduct)),
        Expanded(
          child: Products(_products, _deleteProduct),
        )
      ],
    );
  }
}
