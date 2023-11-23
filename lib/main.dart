import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutix/firebase_options.dart';
import 'package:flutix/models/models.dart';
import 'package:flutix/providers/providers.dart';
import 'package:flutix/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PageData()),
        ChangeNotifierProvider(create: (context) => MovieData()),
        ChangeNotifierProvider(create: (context) => TicketData()),
        ChangeNotifierProvider(create: (context) => ThemeModeData()),
        ChangeNotifierProvider(create: (context) => UserData()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutix',

      // light mode
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          background: colors["soapstone"]!, // warna putih background
          onBackground: colors["cinder"]!, // warna hitam text
          primary: colors["soapstone"]!, // warna putih background
          onPrimary: colors["cinder"]!, // warna hitam text
          secondary: colors["light-grey"]!, // warna abu-abu gelap background
          onSecondary: colors["dove-grey"]!, // warna abu-abu terang text
          error: colors["red-brown"]!, // warna merah background error
          onError: colors["red-brown"]!, // warna merah text error
          surface: colors["soapstone"]!, // warna putih background
          onSurface: colors["cinder"]!, // warna hitam text
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: colors["cerulean-blue"],
            foregroundColor: colors["soapstone"],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: colors["soapstone"],
          foregroundColor: colors["cinder"],
          actionsIconTheme: IconThemeData(color: colors["cinder"]),

        ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: colors["soapstone"],
          )
      ),

      // dark mode
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          background: colors["cinder"]!, // warna hitam backgrund
          onBackground: colors["soapstone"]!, // warna putih text
          primary: colors["cinder"]!, // warna hitam background
          onPrimary: colors["soapstone"]!, // warna putih text
          secondary: colors["dark-jungle-green"]!, // warna hitam terang
          onSecondary: colors["dove-grey"]!, // warna abu-abu gelap text
          error: colors["red-brown"]!, // warna merah background error
          onError: colors["red-brown"]!, // warna merah text error
          surface: colors["cinder"]!, // warna hitam background
          onSurface: colors["soapstone"]!, // warna putih text
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: colors["cerulean-blue"],
            foregroundColor: colors["soapstone"],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: colors["cinder"],
          foregroundColor: colors["soapstone"],
          actionsIconTheme: IconThemeData(color: colors["soapstone"]),
          surfaceTintColor: colors["soapstone"],
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: colors["cinder"],
        )
      ),

      themeMode: Provider.of<ThemeModeData>(context).themeMode,
      // home: const SplashPage(),
      
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return SplashPage();
          }
        },
      ),
    );
  }
}
