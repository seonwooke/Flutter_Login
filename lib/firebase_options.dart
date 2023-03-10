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
        return ios;
      case TargetPlatform.macOS:
        return macos;
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
    apiKey: 'AIzaSyARRPxbLMefigBnsu4LW2YGZCfq8JbtgN4',
    appId: '1:36186893624:web:1e1296231f94d5e43fa5cd',
    messagingSenderId: '36186893624',
    projectId: 'flutter-study-4bbd1',
    authDomain: 'flutter-study-4bbd1.firebaseapp.com',
    storageBucket: 'flutter-study-4bbd1.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAkv9-f1EjHrHshHx4oJSuGv0IzQy9DpSE',
    appId: '1:36186893624:android:dac5a55ec149e9b33fa5cd',
    messagingSenderId: '36186893624',
    projectId: 'flutter-study-4bbd1',
    storageBucket: 'flutter-study-4bbd1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDM9yxaASaGmVwxbLxCZ4tBZeGfSJyRZp4',
    appId: '1:36186893624:ios:24e32cc7dcfaf5583fa5cd',
    messagingSenderId: '36186893624',
    projectId: 'flutter-study-4bbd1',
    storageBucket: 'flutter-study-4bbd1.appspot.com',
    iosClientId: '36186893624-mooi441gl4ppocodr2890fu4gpmb4bof.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterLogin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDM9yxaASaGmVwxbLxCZ4tBZeGfSJyRZp4',
    appId: '1:36186893624:ios:24e32cc7dcfaf5583fa5cd',
    messagingSenderId: '36186893624',
    projectId: 'flutter-study-4bbd1',
    storageBucket: 'flutter-study-4bbd1.appspot.com',
    iosClientId: '36186893624-mooi441gl4ppocodr2890fu4gpmb4bof.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterLogin',
  );
}
