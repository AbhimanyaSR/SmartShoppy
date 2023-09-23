import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get PlatformOptions {
    if (Platform.isIOS) {
      //! For iOS and macOS
      return const FirebaseOptions(
          apiKey: 'AIzaSyCLf51CaTvP2XFtnO9O5JOLc_8mOYA6Bzs',
          appId: '1:689837223555:ios:5da79d1de3b201eaa135b6',
          messagingSenderId: '689837223555',
          projectId: 'smart-shopy',
          iosBundleId: 'com.example.smartShopy');
    } else {
      //! For Android
      return const FirebaseOptions(
        apiKey: 'AIzaSyAW9awsMK9QQiynV7Hgdkw5ULaN2O2feSY',
        appId: '1:689837223555:android:befb7c7229ef379fa135b6',
        messagingSenderId: '689837223555',
        projectId: 'smart-shopy',
      );
    }
  }
}
