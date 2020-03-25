import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function _addProduct;
  ProductCreatePage(this._addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String _titleValue = '';
  String _descriptionValue = '';
  double _priceValue;

  Widget _buildTitleTextField() {
    return TextField(
      decoration: InputDecoration(
          labelText: 'Product Title', border: OutlineInputBorder()),
      onChanged: (String value) {
        setState(() {
          _titleValue = value;
        });
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextField(
      decoration: InputDecoration(
          labelText: 'Description', border: OutlineInputBorder()),
      maxLines: 4,
      onChanged: (String value) {
        setState(() {
          _descriptionValue = value;
        });
      },
    );
  }

  Widget _buildPriceTextField() {
    return TextField(
      decoration:
          InputDecoration(labelText: 'Price', border: OutlineInputBorder()),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      onChanged: (String value) {
        setState(() {
          _priceValue = double.parse(value);
        });
      },
    );
  }

  void _submitForm() {
    final Map<String, dynamic> product = {
      'title': _titleValue,
      'description': _descriptionValue,
      'price': _priceValue,
      'image': 'assets/fruits.png'
    };
    widget._addProduct(product);
    Navigator.pushReplacementNamed(context, '/products');
  }

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          _buildTitleTextField(),
          SizedBox(
            height: 10.0,
          ),
          _buildDescriptionTextField(),
          SizedBox(
            height: 10.0,
          ),
          _buildPriceTextField(),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
              child: Text('Save'),
              textColor: Colors.white70,
              onPressed: _submitForm),
        ],
      ),
    );
  }
}
