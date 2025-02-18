import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echonotes_/echnotepage1example.dart';
import 'package:flutter_echonotes_/firebase_options.dart';
import 'package:flutter_echonotes_/notepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Notepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
