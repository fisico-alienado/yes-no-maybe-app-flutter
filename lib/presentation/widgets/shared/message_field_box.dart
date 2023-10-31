import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    final focusNode = FocusNode(); // Widget para controlar cuando estamos escribiendo, si enviamos el texto que se mantenga el teclado de escritura, minimize, etc

    final textController = TextEditingController();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: colors.primary),
      borderRadius: BorderRadius.circular(20)
    );

    final inputDecoration = InputDecoration(
      hintText: 'Termina tu mensaje con "??"',
      filled: true,
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      suffixIcon: IconButton(
        icon: const Icon( Icons.send_outlined ),
        onPressed: () {
          // CLAVE - como cogemos el valor de la caja de texto
          final textValue = textController.value.text;
          print('button: $textValue');
          textController.clear(); // Si enviamos el mensaje con el icono de la flechita que hemos puesto como decorador, se tiene que borrar el texto
        },
      )
    );

    return TextFormField(
      onTapOutside: (event) { // lo que sucede al clickar fuera del TextFormField, es decir, nuestra caja de mensajes
        focusNode.unfocus(); // que minimice el keyboard
      },
      focusNode: focusNode,
      decoration: inputDecoration,
      controller: textController,
      onFieldSubmitted: (value) { // onFieldSubmitted, como su nombre indica, es lo que sucede cuando enviamos el mensaje presionando "enter" o con "enviar"
        print('Submit value $value');
        textController.clear();
        focusNode.requestFocus(); // Cuando enviamos el texto y se limpia la caja de texto, que mantenga el foco en la caja de texto con el keyboard, para que no se minimice
      },
    );
  }
}