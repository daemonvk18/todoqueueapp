// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyBA8NULOWp6MC3c7Jxo76EiUDIIM0lTvW8',
    appId: '1:1065793725536:web:f16bb158675765184a4f05',
    messagingSenderId: '1065793725536',
    projectId: 'todoqueue-2f7fe',
    authDomain: 'todoqueue-2f7fe.firebaseapp.com',
    storageBucket: 'todoqueue-2f7fe.firebasestorage.app',
    measurementId: 'G-FCM4KT33WS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCiymMczSXi6e35BE5lf1w1-mBntanexO8',
    appId: '1:1065793725536:android:98d3dfb4d7d1e6304a4f05',
    messagingSenderId: '1065793725536',
    projectId: 'todoqueue-2f7fe',
    storageBucket: 'todoqueue-2f7fe.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDmwySpU5mF3op8zOhNCgyyucIoqRY4TGI',
    appId: '1:1065793725536:ios:44c15eb9ab5506f74a4f05',
    messagingSenderId: '1065793725536',
    projectId: 'todoqueue-2f7fe',
    storageBucket: 'todoqueue-2f7fe.firebasestorage.app',
    iosBundleId: 'com.example.todoqueueapp',
  );
}
