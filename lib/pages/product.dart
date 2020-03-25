import 'package:flutter/material.dart';
import 'dart:async';
import '../widgets/ui_elements/title_default.dart';

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

  Widget _buildAddressPriceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Pulchowk, Lalitpur',
          style: TextStyle(color: Colors.grey, fontFamily: 'Oswald'),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(
            '|',
            style: TextStyle(color: Colors.grey, fontFamily: 'Oswald'),
          ),
        ),
        Text(
          '\$' + _product['price'].toString(),
          style: TextStyle(fontFamily: 'Oswald', color: Colors.grey),
        )
      ],
    );
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
              Image.asset(_product['image']),
              SizedBox(height: 10.0),
              TitleDefault(_product['title']),
              SizedBox(height: 10.0),
              _buildAddressPriceRow(),
              SizedBox(
                height: 10.0,
              ),
              Text(
                _product['description'],
                style: TextStyle(fontSize: 18.0),
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
