import 'package:flutter/material.dart';

class MyApp88 extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp88> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? UsernameError;
  String? PasswordError;

  String? validateUsername(String Username) {
    if (RegExp(r'[!@#<>?":_~;[\]\\|=+(*&^%0-9-)]').hasMatch(Username)) {
      return 'Username must not contain special characters or numbers';
    }
    if (Username.isEmpty) {
      return 'username cannot be empty';
    }
    return null;
  }

  String? validatePassword(String Password) {
    if (Password.length < 6) {
      return 'password must be at least 6 characters long';
    }

    if (!RegExp(r'[A-Z]').hasMatch(Password)) {
      return 'password must be at least one upercase letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(Password)) {
      return 'password must be at least one number';
    }
    return null;
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    // Perform submission logic here
    print("Username: ${nameController.text}");
    print("Password: ${passwordController.text}");
  }

  void _clear() {
    setState(() {
      nameController.clear();
      passwordController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter TextField Example'),
      ),
      body: Column(
        children: [
          CircleAvatar(
            maxRadius: 100,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 80),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'User Name',
                        errorText: UsernameError,
                        hintText: 'Enter Your Name',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          UsernameError = validateUsername(value);
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        errorText: PasswordError,
                        hintText: 'Enter the password',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        PasswordError = validatePassword(value);
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _submit,
                        child: Text('Submit'),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            UsernameError =
                                validateUsername(nameController.text);
                            PasswordError =
                                validatePassword(passwordController.text);
                          });
                          if (UsernameError == null && PasswordError == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Login Successful!')));
                          }
                        },
                        child: Text('Clear'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
