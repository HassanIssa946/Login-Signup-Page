import 'package:flutter/material.dart';
import 'package:login_signup/view/screens/loginscreen.dart';
import 'package:flutter/services.dart';
import 'package:login_signup/view/screens/signupscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_signup/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Loginscreen(),
      routes: {
        "/login": (context) => const Loginscreen(),
        '/signup': (context) => const Signupscreen()
      },
    );
  }
}
