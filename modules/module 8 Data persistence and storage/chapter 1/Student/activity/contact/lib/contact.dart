

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(
    MaterialApp(
      home: My_contact(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class My_contact extends StatefulWidget {
  const My_contact({Key? key}) : super(key: key);

  @override
  State<My_contact> createState() => _My_contactState();
}

class _My_contactState extends State<My_contact> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  List<Map<String, String>> contacts = [];

  int selectedIndex = -1;
  late SharedPreferences sp;

  getSharedPreferences() async {
    sp = await SharedPreferences.getInstance();
    readFromSharedPreferences();
  }

  saveIntoSharedPreferences() {
    List<String> contactListString = contacts
        .map((contact) => '${contact['name']}:${contact['contact']}')
        .toList();
    sp.setStringList('myData', contactListString);
  }

  readFromSharedPreferences() {
    List<String>? contactListString = sp.getStringList('myData');
    if (contactListString != null) {
      contacts = contactListString.map((contactString) {
        List<String> parts = contactString.split(':');
        return {'name': parts[0], 'contact': parts[1]};
      }).toList();
    }
    setState(() {});
  }

  @override
  void initState() {
    getSharedPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'Contacts List',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Contact Name',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: contactController,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: const InputDecoration(
                hintText: 'Contact Number',
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                  ),
                  onPressed: () {
                    String name = nameController.text.trim();
                    String contact = contactController.text.trim();
                    if (name.isNotEmpty && contact.isNotEmpty) {
                      setState(() {
                        nameController.text = '';
                        contactController.text = '';
                        contacts.add({'name': name, 'contact': contact});
                      });
                      saveIntoSharedPreferences();
                    }
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            contacts.isEmpty
                ? const Text(
                    'No Contact yet..',
                    style: TextStyle(fontSize: 22),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: contacts.length,
                      itemBuilder: (context, index) => getRow(index),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contacts[index]['name']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(contacts[index]['contact']!),
          ],
        ),
        trailing: IconButton(
          // Changed to call the stored contact number
          onPressed: () => _launchPhone(contacts[index]['contact']!), // <-- Changed line
          icon: const Icon(Icons.phone),
        ),
      ),
    );
  }
}

// Function to launch phone app
Future<void> _launchPhone(String phone) async {
  final Uri phoneLaunchUri = Uri(
    scheme: 'tel',
    path: phone,
  );
  if (!await launchUrl(phoneLaunchUri)) { // <-- Changed line
    throw 'Could not launch $phoneLaunchUri';
  }
}
