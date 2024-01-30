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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAK7IZF5J7J0jri5JN0p9GP7SGzLMslGQs',
    appId: '1:74259003795:android:eb529bc1fe84c4f1ad1066',
    messagingSenderId: '74259003795',
    projectId: 'vend-ease',
    databaseURL: 'https://vend-ease-default-rtdb.firebaseio.com',
    storageBucket: 'vend-ease.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBX9cnLVsxJ2SiH0RFwb-ykTDaNbOe2ca0',
    appId: '1:74259003795:ios:6f248b825fe422f7ad1066',
    messagingSenderId: '74259003795',
    projectId: 'vend-ease',
    databaseURL: 'https://vend-ease-default-rtdb.firebaseio.com',
    storageBucket: 'vend-ease.appspot.com',
    iosClientId: '74259003795-3rcput36t3qvbk4c8dki2dtv1p3ig5ig.apps.googleusercontent.com',
    iosBundleId: 'com.vendeaze.app',
  );
}
