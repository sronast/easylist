import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  final String _price;
  PriceTag(this._price);
  Widget build(context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.5, horizontal: 6.0),
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(5.0)),
      child: Text(
        '\$$_price',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
