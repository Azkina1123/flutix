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

      // // dark mode
      // darkTheme: ThemeData(
      //     useMaterial3: true,
      //     colorScheme: ColorScheme(
      //       brightness: Brightness.dark,
      //       background: colors["cinder"]!,     // warna background halaman
      //       onBackground: colors["soapstone"]!,// warna text dalam halaman
      //       primary: colors["cerulean-blue"]!, // warna background primary (tombol biru)
      //       onPrimary: colors["soapstone"]!,   // warna text dalam primary (warna text dalam tombol biru)
      //       secondary: colors["dark-jungle-green"]!,  // warna background secondary (tombol hitam terang)
      //       onSecondary: colors["dove-grey"]!, // warna text dalam secondary (warna text dalam tombol abu-abu)
      //       error: colors["red-brown"]!,       // warna background error
      //       onError: colors["red-brown"]!,     // warna text dalam error
      //       surface: colors["cinder"]!,        // warna background permukaan widget
      //       onSurface: colors["soapstone"]!,   // warna text dalam permukaan widget
      //     )),

      // light mode
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          background: colors["soapstone"]!,   // warna background halaman
          onBackground: colors["cinder"]!,    // warna text dalam halaman
          primary: colors["cerulean-blue"]!,  // warna background primary (tombol biru)
          onPrimary: colors["soapstone"]!,    // warna text dalam primary (warna text dalam tombol biru)
          secondary: colors["light-grey"]!,   // warna background secondary (tombol abu-abu)
          onSecondary: colors["dove-grey"]!,  // warna text dalam secondary (warna text dalam tombol abu-abu)
          error: colors["red-brown"]!,        // warna background error
          onError: colors["red-brown"]!,      // warna text dalam error
          surface: colors["soapstone"]!,      // warna background permukaan widget
          onSurface: colors["cinder"]!,       // warna text dalam permukaan widget
        ),
        
      ),
      home: const MainPage(),
    );
  }
}
