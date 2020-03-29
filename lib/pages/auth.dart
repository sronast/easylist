import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  final Map<String, dynamic> _formData = {
    'email': null,
    'pass': null,
    '_acceptTerms': false
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.95), BlendMode.dstATop),
        fit: BoxFit.cover,
        image: AssetImage('assets/background.jpg'));
  }

  Widget _buildEmailTextField() {
    return TextFormField(
        decoration: InputDecoration(
            labelText: 'Email', fillColor: Colors.white70, filled: true),
        onSaved: (String value) {
          _formData['email'] = value;
        },
        validator: (String value) {
          if (value.isEmpty ||
              !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                  .hasMatch(value)) {
            return 'Please enter a valid email';
          }
          return null;
        });
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password', filled: true, fillColor: Colors.white70),
      onSaved: (String value) {
        _formData['pass'] = value;
      },
      validator: (String value) {
        if (value.trim().length < 5) {
          return 'Password must be atleast 5 characters long';
        }
        return null;
      },
    );
  }

  Widget _buildSwitchListTile() {
    return Container(
        decoration: BoxDecoration(color: Colors.grey),
        child: SwitchListTile(
          value: _formData['_acceptTerms'],
          onChanged: (bool value) {
            setState(() {
              _formData['acceptTerms'] = value;
            });
          },
          title: Text('Accept Terms'),
        ));
  }

  void _submitForm() {
    // if (_formKey.currentState.validate() && _formData['acceptTerms'] == true) {
    _formKey.currentState.save();
    Navigator.pushReplacementNamed(context, '/products');
    // }
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
              child: Form(
                key: _formKey,
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
      ),
    );
  }
}
