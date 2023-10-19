import 'package:flutter/material.dart';
import 'package:flutix/ui/pages/pages.dart';
import 'package:flutix/models/models.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutix',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: lightMode ? Colors.white : colors["cinder"]!),
        useMaterial3: true,
        
      ),
      home: MainPage(),
    );
  }
}