import 'package:flutter/material.dart';
import 'package:smart_shopy/constants/theme.dart';
import 'package:smart_shopy/screens/auth_ui/welcome/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
  _initFirebase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Shopy',
      theme: themeData,
      home: const WelcomeScreen(),
    );
  }
}

_initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
