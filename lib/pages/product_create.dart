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
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'price': null,
    'image': 'assets/fruits.png'
  };

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Product Title', border: OutlineInputBorder()),
      validator: (String value) {
        if (value.isEmpty || value.trim().length < 3) {
          return "Minimum length of title should be 3";
        }
        return null;
      },
      onSaved: (String value) {
        _formData['title'] = value;
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Description', border: OutlineInputBorder()),
      onSaved: (String value) {
        _formData['description'] = value;
      },
      validator: (String value) {
        if (value.isEmpty || value.trim().length < 10) {
          return "Minimum length of decription should be 10";
        }
        return null;
      },
      maxLines: 4,
    );
  }

  Widget _buildPriceTextField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Price', border: OutlineInputBorder()),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      onSaved: (String value) {
        _formData['price'] = double.parse(value);
      },
      validator: (String value) {
        if (value.isEmpty) {
          return "Price is required";
        }
        return null;
      },
    );
  }

  void _submitForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      widget._addProduct(_formData);
      Navigator.pushReplacementNamed(context, '/products');
    }
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
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
        ),
      ),
    );
  }
}
