import 'dart:io';

import 'package:flash/Pages/Login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid ? await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyButYRGdRZoJOGX5W2aU3ZFjrQdtCh6qn4",
        appId: "1:469235333597:android:19b585f8785d166be6de34",
        messagingSenderId: "469235333597",
        projectId: "flash-6d3d6"
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

