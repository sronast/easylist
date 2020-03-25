import 'package:flutter/material.dart';
import './product_card.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> _products;

  Products(this._products);

  Widget _buildProductList() {
    final productsLength = _products.length;
    Widget productCard;

    if (productsLength == 0) {
      productCard = Center(child: Text('Please add some items!!'));
    } else {
      productCard = ListView.builder(
        itemCount: productsLength,
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(_products[index], index);
        },
      );
    }
    return productCard;
  }

  Widget build(BuildContext context) {
    return _buildProductList();
  }
}
