import 'package:flutter/material.dart';
import 'dart:async';

class ProductPage extends StatelessWidget {
  final Map<String, dynamic> _product;
  ProductPage(this._product);

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(_product['name']),
          ),
          body: Column(
            children: <Widget>[
              Container(margin: EdgeInsets.all(10.0)),
              Image.asset(_product['path']),
              Center(
                child: Text('Your Product detail'),
              ),
              Container(
                alignment: Alignment.center,
                child: RaisedButton(
                  color: Colors.red,
                  child: Text(
                    'Delete',
                    style: TextStyle(color: Colors.white70),
                  ),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                ),
              )
            ],
          )),
    );
  }
}
