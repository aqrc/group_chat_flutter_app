import 'package:flutter/material.dart';
import 'package:groupchat/model/state/app_state.dart';
import 'package:provider/provider.dart';

class NameInput extends StatelessWidget {
  const NameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var inputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Theme.of(context).primaryColor),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
      child: TextFormField(
        validator: (value) => (value == null || value.isEmpty)
            ? "Name should not be empty"
            : null,
        onChanged: (value) => context.read<AppState>().setName(value),
        decoration: InputDecoration(
          disabledBorder: inputBorder,
          focusedBorder: inputBorder,
          focusedErrorBorder: inputBorder,
          errorBorder: inputBorder,
          enabledBorder: inputBorder,
          hintText: 'Enter your name here...',
        ),
      ),
    );
  }
}
