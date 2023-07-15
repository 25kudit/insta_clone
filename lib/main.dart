import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instaclone/responsive/mobile_screen_layout.dart';
import 'package:instaclone/responsive/responsive_layout_screen.dart';
import 'package:instaclone/responsive/web_screen_layout.dart';
import 'package:instaclone/screens/login_screen.dart';
import 'package:instaclone/screens/signup_screen.dart';
import 'package:instaclone/utils/colors.dart';
import 'package:instaclone/utils/firebase_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
      options: firebaseConfig,
    );
  }
  else{
    await Firebase.initializeApp();
  }
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      home: signupScreen(),
      // home: const ResponsiveLayout(
      //     webScreenLayout: WebScreenLayout(),
      //     mobileScreenLayout: MobileScreenLayout()),
    );
  }
}
