import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC09nJAdNlbdTVNE6ehJU3d1xY-HF6TTpY",
            authDomain: "moblivre-4e5b2.firebaseapp.com",
            projectId: "moblivre-4e5b2",
            storageBucket: "moblivre-4e5b2.appspot.com",
            messagingSenderId: "389718582340",
            appId: "1:389718582340:web:ad49bee8a4604b67400811"));
  } else {
    await Firebase.initializeApp();
  }
}
