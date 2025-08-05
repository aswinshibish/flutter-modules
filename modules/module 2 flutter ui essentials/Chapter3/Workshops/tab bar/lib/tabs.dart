import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: const Text('TabBar Example')),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'home',
                icon: Icon(Icons.home)),
              Tab(text: 'search',
                icon: Icon(Icons.search)), 
              Tab(text: 'profile',
                icon: Icon(Icons.people)),// Single tab with Home icon
            ],
            
            
          ),
          
          backgroundColor: Colors.yellowAccent,
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text(
                'Home',
                style: TextStyle(fontSize: 24), // Centered text for the tab
              ),
            ),
            Center(
              child: Text(
                'Search',
                style: TextStyle(fontSize: 24), // Centered text for the tab
              ),
            ),
            Center(
              child: Text(
                'profile',
                style: TextStyle(fontSize: 24), // Centered text for the tab
              ),
            ),
          ],
        ),
      ),
    );
  }
}
