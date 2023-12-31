// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyACaR0M_Ts0bRxBhgjBlDjGnCHD3fnSAAU',
    appId: '1:619964074419:web:621e2f1713655f62bb23c6',
    messagingSenderId: '619964074419',
    projectId: 'flutix-84a43',
    authDomain: 'flutix-84a43.firebaseapp.com',
    storageBucket: 'flutix-84a43.appspot.com',
    measurementId: 'G-SEHGKKP73D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDrecoESvCebzzUQpkfTCgvA6OH8UAQZX4',
    appId: '1:619964074419:android:87387dfcb5d6464cbb23c6',
    messagingSenderId: '619964074419',
    projectId: 'flutix-84a43',
    storageBucket: 'flutix-84a43.appspot.com',
  );
}
