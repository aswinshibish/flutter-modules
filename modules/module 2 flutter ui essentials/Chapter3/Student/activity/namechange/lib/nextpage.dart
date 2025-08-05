import 'package:flutter/material.dart';

class Nextpage extends StatefulWidget {
  const Nextpage({super.key, required String arguments});

   @override
  State<Nextpage> createState() => _NextpageState();
}

class _NextpageState extends State<Nextpage> {
  final TextEditingController usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Retrieve arguments passed via RouteSettings
    Future.delayed(Duration.zero, () {
      final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      final username = args['username'] ?? '';
      setState(() {
        usernameController.text = username; // Set the username in the controller
      });
    });
  }

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        title: Text(
          usernameController.text.isEmpty ? 'No Username' : usernameController.text,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          usernameController.text.isEmpty ? 'No Username Entered' : usernameController.text,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}