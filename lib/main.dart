import 'dart:io';

import 'package:flash/Pages/Login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid ? await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyB7hqrbXmU0nCCw1PJ9k7BglxZHOybNWhc",
        appId: "1:1026403679002:android:a55f08f171cc63680e8aa3",
        messagingSenderId: "1026403679002",
        projectId: "flash-59b3e"
    )
  ) : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Flutter Demo',
        home: Login()
    );
  }
}

