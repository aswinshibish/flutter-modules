import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class Contact extends StatefulWidget {
  
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
    final String phoneNumber = "8547003461";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Us"),
        backgroundColor: Colors.deepOrangeAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(Icons.contact_mail), // Contact icon
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                      ),
                    ),
                  ),
                ],
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Message',
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add functionality to submit form
                },
                child: const Text("Submit"),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    const Text(
                      "Info",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 50),
                    GestureDetector(
                      onTap: () => _launchEmail('email@example.com'),
                      child: const Icon(Icons.email),
                    ),
                    const SizedBox(height: 50),
                    GestureDetector(
                      onTap: () => _makePhoneCall(),
                      child: Icon(Icons.phone),
                    ),
                    SizedBox(height: 50,),
                    GestureDetector(
                      onTap: () => _launchMap(37.422,-122.084),
                      child: Icon(Icons.map),
                    )
                   
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to launch locate or map app
  Future<void> _launchEmail(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());
    } else {
      throw 'Could not launch $emailLaunchUri';
    }
  }

  // Function to launch phone app
  void _makePhoneCall() async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

Future<void>_launchMap(double latitude,double longitude)async{
  final Uri mapLaunchUri=Uri(
    scheme: 'http',
    host: 'www.google.com',
    path: 'maps/place/$latitude,$longitude',
  );
  if(await canLaunch(mapLaunchUri.toString())){
    await launch(mapLaunchUri.toString());

  }else{
    throw 'could not launch $mapLaunchUri';
  }
}
}
