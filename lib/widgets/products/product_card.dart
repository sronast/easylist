import 'package:flutter/material.dart';
import './price_tag.dart';
import '../ui_elements/title_default.dart';
import './address_tag.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> _product;
  final int _productIndex;

  ProductCard(this._product, this._productIndex);

  Widget _buildTitlePriceRow() {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TitleDefault(_product['title']),
          SizedBox(width: 12.0),
          PriceTag(_product['price'].toString())
        ],
      ),
    );
  }

  Widget _buildActionButtons(context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.info),
          color: Theme.of(context).accentColor,
          onPressed: () {
            Navigator.pushNamed<bool>(context, '/product/$_productIndex');
          },
        ),
        IconButton(
          icon: Icon(Icons.favorite_border),
          color: Colors.red,
          onPressed: () {},
        )
      ],
    );
  }

  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Image.asset(_product['image']),
          _buildTitlePriceRow(),
          AddressTag('Pulchowk, Lalitpur'),
          _buildActionButtons(context),
        ],
      ),
    );
  }
}
