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

        colorScheme: ColorScheme(
          brightness: lightMode ? Brightness.light : Brightness.dark,
          background: lightMode ? colors["soapstone"]! : colors["cinder"]!, // warna background halaman
          onBackground: lightMode ? colors["cinder"]! : colors["soapstone"]!, // warna text dalam halaman
          primary: colors["cerulean-blue"]!,  // warna background primary
          onPrimary: colors["soapstone"]!,    // warna text dalam primary
          secondary: colors["light-grey"]!,   // warna background secondary -> kotak abu-abu
          onSecondary: colors["dove-grey"]!,  // warna text dalam secondary
          error: colors["red-brown"]!,        // warna background error
          onError: colors["red-brown"]!,      // warna text dalam error
          surface: lightMode ? colors["soapstone"]! : colors["cinder"]!,  // warna background card
          onSurface: lightMode ? colors["cinder"]! : colors["soapstone"]!,  // warna text dalam card
        ),

        useMaterial3: true,
        
      ),
      home: const MainPage(),
    );
  }
}