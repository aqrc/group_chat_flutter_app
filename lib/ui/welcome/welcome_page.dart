import 'package:flutter/material.dart';
import 'package:groupchat/ui/chat/chat_page.dart';

import 'component/continue_button.dart';
import 'component/name_input.dart';

class WelcomePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'How should we call you?',
              style: TextStyle(fontSize: 24),
            ),
            Form(
              key: _formKey,
              child: const NameInput(),
            ),
            ContinueButton(
              onPressed: () {
                if (!_formKey.currentState!.validate()) return;

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChatPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
