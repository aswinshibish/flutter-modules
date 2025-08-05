import 'package:flutter/material.dart';

class Mytabbar extends StatefulWidget {
  const Mytabbar({super.key});

  @override
  State<Mytabbar> createState() => _MytabbarState();
}

class _MytabbarState extends State<Mytabbar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3,
      child: Scaffold(appBar: AppBar(title: Text('empetz'),
      backgroundColor: Colors.blue,
      bottom: TabBar(tabs: [
        Tab(icon: Icon(Icons.chat_bubble),
        text: 'chats',),
        Tab(icon: Icon(Icons.video_call),
        text: 'calls',),
        Tab(icon: Icon(Icons.settings),
        text: 'settings',),
      
      ])),
   ), );
  }
}