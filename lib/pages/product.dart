import 'package:flutter/material.dart';
import 'dart:async';

class ProductPage extends StatelessWidget {
  final Map<String, dynamic> _product;
  ProductPage(this._product);

  _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('This cannot be undone'),
            actions: <Widget>[
              FlatButton(
                  color: Colors.green,
                  onPressed: () => Navigator.pop(context),
                  child: Text('NO')),
              FlatButton(
                  color: Colors.red,
                  child: Text('YES'),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context, true);
                  }),
            ],
          );
        });
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(_product['title']),
          ),
          body: Column(
            children: <Widget>[
              Container(margin: EdgeInsets.all(10.0)),
              Image.asset(_product['image']),
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
                  onPressed: () => _showWarningDialog(context),
                ),
              )
            ],
          )),
    );
  }
}
