import 'package:easylist/pages/product_edit.dart';
import 'package:flutter/material.dart';

class ProductListPage extends StatelessWidget {
  final List<Map<String, dynamic>> _products;
  final Function _updateProduct;
  final Function _deleteProduct;

  ProductListPage(this._products, this._updateProduct, this._deleteProduct);

  Widget _buildTrailing(BuildContext context, int index) {
    return IconButton(
        icon: Icon(
          Icons.edit,
          color: Colors.green,
        ),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return ProductEditPage(
              product: _products[index],
              updateProduct: _updateProduct,
              index: index,
            );
          }));
        });
  }

  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _products.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            // confirmDismiss: ,
            onDismissed: (DismissDirection direction) {
              if (direction == DismissDirection.startToEnd)
                _deleteProduct(index);
            },
            key: Key('$index'),
            background: Container(color: Colors.red),
            direction: DismissDirection.startToEnd,
            child: Column(
              children: <Widget>[
                ListTile(
                    leading: CircleAvatar(
                        backgroundImage: AssetImage(
                      _products[index]['image'],
                    )),
                    title: Text(
                      _products[index]['title'],
                    ),
                    subtitle: Text('\$${_products[index]['price'].toString()}'),
                    trailing: _buildTrailing(context, index)),
                Divider(),
              ],
            ),
          );
        });
  }
}
