import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
    appId: '1:123456789012:web:abcdef1234567890',
    messagingSenderId: '123456789012',
    projectId: 'driver-app-12345',
    authDomain: 'driver-app-12345.firebaseapp.com',
    storageBucket: 'driver-app-12345.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
    appId: '1:123456789012:android:abcdef1234567890',
    messagingSenderId: '123456789012',
    projectId: 'driver-app-12345',
    storageBucket: 'driver-app-12345.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
    appId: '1:123456789012:ios:abcdef1234567890',
    messagingSenderId: '123456789012',
    projectId: 'driver-app-12345',
    storageBucket: 'driver-app-12345.appspot.com',
    iosBundleId: 'com.example.driverApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
    appId: '1:123456789012:macos:abcdef1234567890',
    messagingSenderId: '123456789012',
    projectId: 'driver-app-12345',
    storageBucket: 'driver-app-12345.appspot.com',
    iosBundleId: 'com.example.driverApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
    appId: '1:123456789012:windows:abcdef1234567890',
    messagingSenderId: '123456789012',
    projectId: 'driver-app-12345',
    authDomain: 'driver-app-12345.firebaseapp.com',
    storageBucket: 'driver-app-12345.appspot.com',
  );
}
