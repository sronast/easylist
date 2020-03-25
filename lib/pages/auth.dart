import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  bool _accept = false;

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.95), BlendMode.dstATop),
        fit: BoxFit.cover,
        image: AssetImage('assets/background.jpg'));
  }

  Widget _buildEmailTextField() {
    return TextField(
      decoration: InputDecoration(
          labelText: 'Email', fillColor: Colors.white70, filled: true),
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      decoration: InputDecoration(
          labelText: 'Password', filled: true, fillColor: Colors.white70),
    );
  }

  Widget _buildSwitchListTile() {
    return Container(
      decoration: BoxDecoration(color: Colors.grey),
      child: SwitchListTile(
        title: Text('Accept Terms'),
        value: _accept,
        onChanged: (bool value) {
          setState(() {
            _accept = value;
          });
        },
      ),
    );
  }

  void _submitForm() {
    Navigator.pushReplacementNamed(context, '/products');
  }

  Widget build(BuildContext context) {
    final double _deviceWidth = MediaQuery.of(context).size.width;
    final double _targetWidth =
        _deviceWidth > 550.0 ? 400.0 : _deviceWidth * .9;

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(image: _buildBackgroundImage()),
        child: Center(
          // width: 200.0,
          child: SingleChildScrollView(
            child: Container(
              width: _targetWidth,
              child: Column(
                children: <Widget>[
                  _buildEmailTextField(),
                  SizedBox(height: 8.0),
                  _buildPasswordTextField(),
                  SizedBox(height: 8.0),
                  _buildSwitchListTile(),
                  SizedBox(height: 8.0),
                  Container(
                    child: RaisedButton(
                        child: Text('LOGIN'), onPressed: _submitForm),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
