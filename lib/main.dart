import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatspps/whatsapp-home.dart';
// import 'package:whatspps/pages/camera.dart';
import 'dart:async';

late List<CameraDescription> cameras;

Future<Null> main() async {
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "WhatsApp",
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 44, 154, 82),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.teal,
        ).copyWith(
          secondary: Colors.green, // This replaces accentColor
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: WhatsAppHome(cameras),
    );
  }
}
