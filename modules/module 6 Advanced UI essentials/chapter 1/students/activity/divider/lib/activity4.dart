import 'package:flutter/material.dart';

class Activity4 extends StatefulWidget {
  const Activity4({super.key});

  @override
  State<Activity4> createState() => _Activity4State();
}

class _Activity4State extends State<Activity4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text('Settings',style: TextStyle(color: Colors.white),),),
        body: ListView(
        padding: EdgeInsets.zero,
        children: [
          
          ListTile(
            leading: Icon(Icons.network_cell),
            title: Text('Network'),
            subtitle: Text('manage network settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('language'),
            subtitle: Text('change app language'),
            onTap: () {
              
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.color_lens),
            title: Text('Theme'),
            subtitle: Text('choose light or dark theme'),
            onTap: () {
              
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.volume_down_outlined),
            title: Text('Sound & volume'),
            subtitle: Text('adujust sound and vibration settings'),
            onTap: () {
              
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            subtitle: Text('additional settings options'),
            onTap: () {
              
            },
          ),
          Divider()
        ],
                ),
    );
  }
}