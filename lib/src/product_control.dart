import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  final Function addProduct;
  ProductControl(this.addProduct);

  @override
  Widget build(BuildContext context) {
    return (RaisedButton(
      color: Theme.of(context).primaryColor,
      child: Text('Add New Product'),
      onPressed: () {
        addProduct({'title': 'NewDProduct', 'productUrl':'assets/fruits.png'});
      },
    ));
  }
}
