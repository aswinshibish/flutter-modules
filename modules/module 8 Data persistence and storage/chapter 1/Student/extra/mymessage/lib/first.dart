import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Myfirst extends StatefulWidget {
  const Myfirst({super.key});

  @override
  State<Myfirst> createState() => _MyfirstState();
}

class _MyfirstState extends State<Myfirst> {
  final _notifications = FlutterLocalNotificationsPlugin();

  @override 
  void  initState(){
    super.initState();
    FirebaseMessaging.instance.requestPermission();
    FirebaseMessaging.instance.getToken().then((token)=> print('Token:$token'));
    _initNotifications();
    FirebaseMessaging.onMessage.listen(_showNotification);
  }

  void _initNotifications(){
    _notifications.initialize(const InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      ));
  }

  Future<void>_showNotification(RemoteMessage message)async{
    final androidDetails = AndroidNotificationDetails(
      "channel_id", "notifications",
      importance: Importance.high,
    );
    await _notifications.show(
      0,
      message.notification?.title,
      message.notification?.body,
      NotificationDetails(android: androidDetails),
    );
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text("Push Notifications",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Text('Waiting for notifications...'),
      ),
    );
  }
}