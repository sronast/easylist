import 'package:flutter/material.dart';

import '../pages/product.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> _products;
  final Function _deleteProduct;

  Products(this._products, this._deleteProduct);

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Image.asset(_products[index]['path']),
          Text(_products[index]['name']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Details'),
                onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ProductPage(_products[index])))
                      .then((onValue) => _deleteProduct(index));
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProductList() {
    final productsLength = _products.length;
    Widget productCard;

    if (productsLength == 0) {
      productCard = Center(child: Text('Please add some items!!'));
    } else {
      productCard = ListView.builder(
        itemCount: productsLength,
        itemBuilder: _buildProductItem,
      );
    }
    return productCard;
  }

  Widget build(BuildContext context) {
    return _buildProductList();
  }
}
