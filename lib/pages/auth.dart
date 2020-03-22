import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  bool _accept = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            SwitchListTile(
              title: Text('Accept Terms'),
              value: _accept,
              onChanged: (bool value) {
                setState(() {
                  _accept = value;
                });
                _accept = value;
              },
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: RaisedButton(
                child: Text('LOGIN'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/products');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
