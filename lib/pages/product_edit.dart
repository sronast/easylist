import 'package:flutter/material.dart';

class ProductEditPage extends StatefulWidget {
  final Function addProduct;
  final Function updateProduct;
  final Map<String, dynamic> product;
  final int index;

  ProductEditPage(
      {this.product, this.addProduct, this.updateProduct, this.index});

  @override
  State<StatefulWidget> createState() {
    return _ProductEditPageState();
  }
}

class _ProductEditPageState extends State<ProductEditPage> {
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'price': null,
    'image': 'assets/fruits.png'
  };

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
      initialValue: widget.product != null ? widget.product['title'] : "",
      decoration: InputDecoration(
          labelText: 'Product Title', border: OutlineInputBorder()),
      validator: (String value) {
        if (value.isEmpty || value.trim().length < 1) {
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
      initialValue: widget.product != null ? widget.product['description'] : '',
      decoration: InputDecoration(
          labelText: 'Description', border: OutlineInputBorder()),
      onSaved: (String value) {
        _formData['description'] = value;
      },
      validator: (String value) {
        if (value.isEmpty || value.trim().length < 2) {
          return "Minimum length of decription should be 5";
        }
        return null;
      },
      maxLines: 4,
    );
  }

  Widget _buildPriceTextField() {
    return TextFormField(
      initialValue:
          widget.product != null ? widget.product['price'].toString() : '',
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

      widget.product == null
          ? widget.addProduct(_formData)
          : widget.updateProduct(_formData, widget.index);

      Navigator.pushReplacementNamed(context, '/products');
    }
  }

  Widget _buildGestureDetector(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());  //for closing  keyborad
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

  Widget build(BuildContext context) {
    final Widget pageContent = _buildGestureDetector(context);

    return widget.product == null
        ? pageContent
        : Scaffold(
            appBar: AppBar(
              title: Text('Edit Product'),
            ),
            body: pageContent,
          );
  }
}
