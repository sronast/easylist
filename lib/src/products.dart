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
          Container(
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _products[index]['title'],
                  style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Oswald'),
                ),
                SizedBox(width: 12.0),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2.5, horizontal: 6.0),
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Text(
                    '\$${_products[index]['price'].toString()}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 2.5, horizontal: 6.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: Colors.grey, width: 1.0)),
            child: Text('Pulchowk, Lalitpur'),
          ),
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
