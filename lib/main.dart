import 'package:flutter/material.dart';
import 'package:groupchat/ui/welcome/welcome_page.dart';
import 'package:provider/provider.dart';
import 'model/state/app_state.dart';

void main() {
  runApp(
    Provider(
      create: (_) => AppState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GroupChat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WelcomePage(),
    );
  }
}
