import 'package:flutter/material.dart';

class Exercise4 extends StatefulWidget {
  const Exercise4({super.key});

  @override
  State<Exercise4> createState() => _Exercise4State();
}

class _Exercise4State extends State<Exercise4> {
  final TextEditingController UsernameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController PincodeController = TextEditingController();

  String? UsernameError;
  String? phoneNumberError;
  String? pincodeError;

  String? validateUsername(String Username) {
    if (RegExp(r'[!@#<>?":_~;[\]\\|=+(*&^%0-9-)]').hasMatch(Username)) {
      return 'Username must not contain special characters or numbers';
    }
    if (Username.isEmpty) {
      return 'username cannot be empty';
    }
    return null;
  }

  String? validatePhoneNumber(String phoneNumber) {
    if (!RegExp(r'^\d{10}$').hasMatch(phoneNumber)) {
      return 'phone number must be exactly 10 digits';
    }
    return null;
  }

  String? validatePincoder(String pincode) {
    if (!RegExp(r'^\d{6}$').hasMatch(pincode)) {
      return 'pincode must be exactly 6 digits';
    }
    return null;
  }

  void _clear() {
    setState(() {
      UsernameController.clear();
      phoneNumberController.clear();
      PincodeController.clear();
      _selectedItem = null;
    });
  }

  String? _selectedItem = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Interest Calculator'),
        backgroundColor: Colors.indigoAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CircleAvatar(radius: 100, child: Image.asset('image/profile.jpg')),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: UsernameController,
                decoration: InputDecoration(
                    labelText: 'Name',
                    errorText: UsernameError,
                    border: OutlineInputBorder()),
                onChanged: (value) {
                  setState(() {
                    UsernameError = validateUsername(value);
                  });
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: phoneNumberController,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                    labelText: 'Mobile Number',
                    errorText: phoneNumberError,
                    border: OutlineInputBorder()),
                onChanged: (value) {
                  setState(() {
                    phoneNumberError = validatePhoneNumber(value);
                  });
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Expanded(
                      child: TextField(
                          controller: PincodeController,
                          keyboardType: TextInputType.number,
                          maxLength: 6,
                          decoration: InputDecoration(
                              labelText: 'Pincode',
                              errorText: pincodeError,
                              border: OutlineInputBorder()),
                          onChanged: (value) {
                            setState(() {
                              pincodeError = validatePincoder(value);
                            });
                          }),
                    ),
                  ),
                ),
                DropdownButton(
                    value: _selectedItem,
                    items: <String>['female', 'male']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    hint: Text('Gender'),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue;
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        pincodeError = validatePincoder(PincodeController.text);
                      });

                      if (pincodeError == null &&
                          UsernameError == null &&
                          phoneNumberError == null &&
                          _selectedItem == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Register successsfully")));
                      }
                    },
                    child: Text('Register')),
                ElevatedButton(onPressed: _clear, child: Text('Clear all'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
