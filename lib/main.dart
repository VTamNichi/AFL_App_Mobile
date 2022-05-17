import 'package:amateur_football_league_mobile/screens/login/login_screen.dart';
import 'package:amateur_football_league_mobile/services/google_sign_in_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      )
    );
  }
}

