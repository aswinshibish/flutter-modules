import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CallButtonScreen(),
    );
  }
}

class CallButtonScreen extends StatelessWidget {
  final String phoneNumber = "8547003461";

  void _makePhoneCall() async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Call Button App")),
      body: Center(
        child: ElevatedButton(
          onPressed: _makePhoneCall,
          child: Text("Call $phoneNumber"),
        ),
      ),
    );
  }
}
