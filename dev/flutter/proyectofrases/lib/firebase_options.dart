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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyD17xx5IabE3eTJx_QD9MRacNFmJfOmPcE',
    appId: '1:926067941480:web:515e26e7e9817761125bdd',
    messagingSenderId: '926067941480',
    projectId: 'proyectodefrasesinspirad-78ddb',
    authDomain: 'proyectodefrasesinspirad-78ddb.firebaseapp.com',
    storageBucket: 'proyectodefrasesinspirad-78ddb.firebasestorage.app',
    measurementId: 'G-STWTNF61GC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyABjTJ5H5GbJeNLMsskJQhW-1u6I_mxI1Y',
    appId: '1:926067941480:android:4c7bb641685b138f125bdd',
    messagingSenderId: '926067941480',
    projectId: 'proyectodefrasesinspirad-78ddb',
    storageBucket: 'proyectodefrasesinspirad-78ddb.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAaeEXFfY88iJmq6VLmAZysuPuPrFw7754',
    appId: '1:926067941480:ios:3d609914fc566fa8125bdd',
    messagingSenderId: '926067941480',
    projectId: 'proyectodefrasesinspirad-78ddb',
    storageBucket: 'proyectodefrasesinspirad-78ddb.firebasestorage.app',
    iosBundleId: 'com.example.proyectofrases',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAaeEXFfY88iJmq6VLmAZysuPuPrFw7754',
    appId: '1:926067941480:ios:3d609914fc566fa8125bdd',
    messagingSenderId: '926067941480',
    projectId: 'proyectodefrasesinspirad-78ddb',
    storageBucket: 'proyectodefrasesinspirad-78ddb.firebasestorage.app',
    iosBundleId: 'com.example.proyectofrases',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD17xx5IabE3eTJx_QD9MRacNFmJfOmPcE',
    appId: '1:926067941480:web:f8bb223a536c002a125bdd',
    messagingSenderId: '926067941480',
    projectId: 'proyectodefrasesinspirad-78ddb',
    authDomain: 'proyectodefrasesinspirad-78ddb.firebaseapp.com',
    storageBucket: 'proyectodefrasesinspirad-78ddb.firebasestorage.app',
    measurementId: 'G-K5D81JDN9V',
  );
}
