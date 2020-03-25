import 'package:flutter/material.dart';

class AddressTag extends StatelessWidget {
  final String _address;
  AddressTag(this._address);
  
  Widget build(context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.5, horizontal: 6.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: Colors.grey, width: 1.0)),
      child: Text(_address),
    );
  }
}
