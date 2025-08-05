import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
  ));
}


class paginatorScreen extends StatefulWidget {
  const paginatorScreen({super.key});

  @override
  State<paginatorScreen> createState() => _paginatorScreenState();
}

class _paginatorScreenState extends State<paginatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Pagination Demo'),centerTitle: true,
        
      ),
    );
  }
}
