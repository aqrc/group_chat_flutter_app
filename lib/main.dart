import 'package:flutter/material.dart';
import 'package:groupchat/ui/chat/chat_page.dart';
import 'package:groupchat/ui/chat/component/message.dart';
import 'package:groupchat/ui/welcome/welcome_page.dart';

void main() {
  runApp(const MyApp());
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
      // home: const WelcomePage(),
      home: const ChatPage(),
    );
  }
}
