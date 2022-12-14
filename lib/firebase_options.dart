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
    apiKey: 'AIzaSyDoGSD9u-9p5BQN505p3GNc1RuYlg0Sz9E',
    appId: '1:557494169391:web:79bd91e7c6eedb2d173bda',
    messagingSenderId: '557494169391',
    projectId: 'upload-474c2',
    authDomain: 'upload-474c2.firebaseapp.com',
    storageBucket: 'upload-474c2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCswIUrdNVV2_s_IQPNclNb06iW-womGD8',
    appId: '1:557494169391:android:7d1d6c84605e9db0173bda',
    messagingSenderId: '557494169391',
    projectId: 'upload-474c2',
    storageBucket: 'upload-474c2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAY6_HYbZQJe4Sb0_Xgq1wNqidkMPyCi_I',
    appId: '1:557494169391:ios:4f18acbb520268d0173bda',
    messagingSenderId: '557494169391',
    projectId: 'upload-474c2',
    storageBucket: 'upload-474c2.appspot.com',
    iosClientId: '557494169391-sei53isu8f7std4p6m4en3pmmj1ahahh.apps.googleusercontent.com',
    iosBundleId: 'com.example.upload',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAY6_HYbZQJe4Sb0_Xgq1wNqidkMPyCi_I',
    appId: '1:557494169391:ios:4f18acbb520268d0173bda',
    messagingSenderId: '557494169391',
    projectId: 'upload-474c2',
    storageBucket: 'upload-474c2.appspot.com',
    iosClientId: '557494169391-sei53isu8f7std4p6m4en3pmmj1ahahh.apps.googleusercontent.com',
    iosBundleId: 'com.example.upload',
  );
}
