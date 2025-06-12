import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quantum/splash.dart';
import 'package:quantum/view/screens/home/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:quantum/view/screens/voice_chat_screen.dart';
import 'package:quantum/viewmodels/text_to_speechViewModel.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AudioViewModel(),
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio TTS MVVM',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => CustomSplashScreen(),
        '/home': (context) => HomeScreen(),
        '/voice': (context) => VoiceChatScreen(),
      },
    );
  }
}
