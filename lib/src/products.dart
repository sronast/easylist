import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> _products;

  Products(this._products);

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Image.asset(_products[index]['image']),
          Text(_products[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Details'),
                onPressed: () {
                  Navigator.pushNamed<bool>(context, '/product/$index');
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
