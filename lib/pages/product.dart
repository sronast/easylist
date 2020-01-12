import 'package:flutter/material.dart';
import 'dart:async';

class Product extends StatelessWidget {
  final Map<String, dynamic> product;
  Product(this.product);

  Widget build(BuildContext context) {
    return WillPopScope(
        //simply listens back button on android device being pressed
        onWillPop: () {
          print('Ronast');
          Navigator.pop(context, false);
          return Future.value(
              false); //allowed to leave the page and go to homepage
        },
        child: Scaffold(
            appBar: AppBar(
              title: Text(product['title']),
            ),
            body: Column(
              children: <Widget>[
                Image.asset(product['productUrl']),
                Container(
                  margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
                  child: RaisedButton(
                    color: Theme.of(context).accentColor,
                    child: Text('Delete'),
                    onPressed: () => Navigator.pop(context, true),
                  ),
                ),
                Text(product['title'])
              ],
            )));
  }
}
