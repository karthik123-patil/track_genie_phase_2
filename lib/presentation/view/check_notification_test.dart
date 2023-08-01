import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:track_genie_phase_2/data/datasources/network/notification_service.dart';

class CheckNotificationCheck extends StatefulWidget {
  CheckNotificationCheck({super.key});

  @override
  State<CheckNotificationCheck> createState() => _CheckNotificationCheckState();
}

class _CheckNotificationCheckState extends State<CheckNotificationCheck> {
  PushNotificationService counterService = PushNotificationService();

  int counter = 0;

  StreamController counterStreamController = StreamController.broadcast();

  Stream get getCounterStream => counterStreamController.stream;

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
        if (message!.from!.startsWith('/topics/')) {
          String topic = message.from!.substring('/topics/'.length);
          print('Received a message from topic: $topic');
        } else {
          print('Received a direct message');
        }

      counter++;
      counterStreamController.sink.add(counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notify Screen from Service Example')),
      body: Center(
        child: StreamBuilder(
          stream: getCounterStream,
          initialData: counter,
          builder: (context, snapshot) {
            print("on ui ${counter}");
            if (snapshot.hasData) {
              return Text('Counter Value: ${counter}',
                  style: TextStyle(fontSize: 24));
            } else {
              return Text('Loading...');
            }
          },
        ),
      ),
    );
  }
}
