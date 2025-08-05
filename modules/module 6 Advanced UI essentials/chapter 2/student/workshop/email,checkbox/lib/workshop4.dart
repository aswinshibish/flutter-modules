import 'package:flutter/material.dart';

class MyForm10 extends StatefulWidget {
  @override
  _MyForm10State createState() => _MyForm10State();
}

class _MyForm10State extends State<MyForm10> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  bool _agreedToTerms = false;

  String? UsernameError;
  String? emailError;

  String? validateUsername(String Username){
    if(RegExp(r'[!@#<>?":_~;[\]\\|=+(*&^%0-9-)]').hasMatch(Username)){
      return 'Username must not contain special characters or numbers';
    }
    if(Username.isEmpty){
      return 'username cannot be empty';
    }
    return null;
  }

  String? validateEmail(String email){
    if (email.length< 6){
      return 'email must be at least 6 characters long';
    }

    if(! RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(email)){
      return 'email must be at least one upercase letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(email)){
      return 'email must be at least one number';
    }
    return null;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  errorText: UsernameError
                ),
                onChanged: (value) {
                  setState(() {
                    UsernameError=validateUsername(value);
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  errorText: emailError
                ),

                onChanged: (value){
                  setState(() {
                    emailError=validateEmail(value);                  });
                },
              ),
              SizedBox(height: 20),
              CheckboxListTile(
                title: Text('I agree to the terms and conditions'),
                value: _agreedToTerms,
                onChanged: (newValue) {
                  setState(() {
                    _agreedToTerms = newValue!;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Form submission logic here
                  String name = _nameController.text;
                  String email = _emailController.text;
                  // Display a dialog with the submitted data
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Form Submitted'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Name: $name'),
                            Text('Email: $email'),
                            Text('Agreed to terms: $_agreedToTerms'),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
