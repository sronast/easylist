import 'package:easylist/pages/product_create.dart';
import 'package:easylist/pages/product_list.dart';
import 'package:easylist/pages/products.dart';
import 'package:flutter/material.dart';

class ManageProduct extends StatelessWidget {
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false,
                title: Text('Select'),
              ),
              ListTile(
                title: Text('All Products'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              )
            ],
          ),
        ),
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
          children: <Widget>[ProductCreatePage(), ProductListPage()],
        )),
      ),
    );
  }
}
