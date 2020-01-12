import 'package:flutter/material.dart';

import '../pages/product.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function deleteProduct;
  Products(this.products, this.deleteProduct);

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset('assets/fruits.png'),
          Container(margin: EdgeInsets.only(bottom: 13.0)),
          Text(products[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.favorite,
                color: Colors.purple,
              ),
              Text('Text'),
              FlatButton(
                  child: Text('Details'),
                  onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Product(products[index]))).then((onValue) {
                        if (onValue) {
                          deleteProduct(index);
                        }
                      }))
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProductList() {
    final itemLength = products.length;
    Widget productCards;

    if (itemLength > 0) {
      productCards = ListView.builder(
        itemCount: itemLength,
        itemBuilder: _buildProductItem,
      );
    } else {
      productCards = Center(
        child: Text('Please add some items'),
      );
    }
    return productCards; //do not return null
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductList();
  }
}
