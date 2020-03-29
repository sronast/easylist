import 'package:easylist/pages/product_edit.dart';
import 'package:easylist/pages/product_list.dart';
import 'package:flutter/material.dart';

class ProductAdminPage extends StatelessWidget {
  final Function _addProduct;
  final Function _deleteProduct;
  final Function _updateProduct;
  final List<Map<String, dynamic>> _products;
  ProductAdminPage(this._addProduct, this._deleteProduct, this._products,
      this._updateProduct);

  Widget _buildSideDrawer(context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Select'),
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('All Products'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/products');
            },
          )
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildSideDrawer(context),
        appBar: AppBar(
          title: Text('Manage Products'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.create),
                text: 'Create Product',
              ),
              Tab(
                icon: Icon(Icons.list),
                text: 'My Products',
              )
            ],
          ),
        ),
        body: Center(
            child: TabBarView(
          children: <Widget>[
            ProductEditPage(addProduct: _addProduct),
            ProductListPage(
              _products, _updateProduct, _deleteProduct
            )
          ],
        )),
      ),
    );
  }
}
