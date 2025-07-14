import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD8SWbzAKmasxKK8MF8fH9Va0yHRalVsps",
            authDomain: "poised-bot-443613-p6.firebaseapp.com",
            projectId: "poised-bot-443613-p6",
            storageBucket: "poised-bot-443613-p6.firebasestorage.app",
            messagingSenderId: "272938015430",
            appId: "1:272938015430:web:570e5efe159f5bc1d7d5c7",
            measurementId: "G-KQJXQWS02E"));
  } else {
    await Firebase.initializeApp();
  }
}
