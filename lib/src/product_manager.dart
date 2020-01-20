import 'package:flutter/material.dart';

import './products.dart';
import './product_control.dart';

class ProductManager extends StatefulWidget {
  final Map<String, dynamic> startingProduct;

  ProductManager({this.startingProduct}); //named argument

  @override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  final List<Map<String,dynamic>> _products = [];
  // never assign new value---final -> but can be updated; never change value----const -> noh allowed;

  @override
  void initState() {
    if (widget.startingProduct != null) {
      _products.add(widget.startingProduct);
    }
    super.initState();
  }

  void _addProduct(Map<String, dynamic> p) {
    setState(() {
      _products.add(p);
    });
  }

  void _deleteProduct(int index){
    setState(() {
      _products.removeAt(index);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          child: ProductControl(_addProduct),
        ),
        Expanded(child: Products(_products, _deleteProduct)),
      ],
    );
  }
}
