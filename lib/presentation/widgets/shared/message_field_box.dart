import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: colors.primary),
      borderRadius: BorderRadius.circular(20)
    );

    final inputDecoration = InputDecoration(
        filled: true,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        suffixIcon: IconButton(
          icon: const Icon( Icons.send_outlined ),
          onPressed: () {
            print('Valor de la caja de texto');
          },
        )
      );

    return TextFormField(
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print('Submit value $value');
      },
      onChanged: (value) {
        print('changed: $value');
      },
    );
  }
}