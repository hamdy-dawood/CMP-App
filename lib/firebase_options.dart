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
    apiKey: 'AIzaSyBsUQi9CgOLeq8SWLZoVGchxwigU9ALPGQ',
    appId: '1:18371111312:web:ea269ee493613b8ad8eb15',
    messagingSenderId: '18371111312',
    projectId: 'cmp-app-44c4e',
    authDomain: 'cmp-app-44c4e.firebaseapp.com',
    storageBucket: 'cmp-app-44c4e.appspot.com',
    measurementId: 'G-P9SW1XJRYB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDsR3f61IVxc01icirGmpLPXEfzrzmVYmI',
    appId: '1:18371111312:android:fab6a239a3cd148ad8eb15',
    messagingSenderId: '18371111312',
    projectId: 'cmp-app-44c4e',
    storageBucket: 'cmp-app-44c4e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB5-LkQk5DrvQx-OsI6I6Cx6fWiZJ_m8no',
    appId: '1:18371111312:ios:6a0daf3962bb401ad8eb15',
    messagingSenderId: '18371111312',
    projectId: 'cmp-app-44c4e',
    storageBucket: 'cmp-app-44c4e.appspot.com',
    iosBundleId: 'com.abdallah.cmpApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB5-LkQk5DrvQx-OsI6I6Cx6fWiZJ_m8no',
    appId: '1:18371111312:ios:a4b4d21dc67d4c4bd8eb15',
    messagingSenderId: '18371111312',
    projectId: 'cmp-app-44c4e',
    storageBucket: 'cmp-app-44c4e.appspot.com',
    iosBundleId: 'com.abdallah.cmpApp.RunnerTests',
  );
}
