import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/auth/auth.dart';
import 'package:to_do_app/providers/my_provider.dart';
import 'package:to_do_app/tabs/homeScreen.dart';
import 'package:to_do_app/tabs/splashScreen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.enableNetwork();
  runApp(ChangeNotifierProvider(
      create: (context) => MyProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      initialRoute: provider.firebaseUser != null
          ? HomeScreen.routeName
          : AuthScreen.routeName,
      debugShowCheckedModeBanner: false,
      routes: {
        //SplashScreen.routeName: (context) => SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        AuthScreen.routeName: (context) => AuthScreen(),
      },
    );
  }
}
