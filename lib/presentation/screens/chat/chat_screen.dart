// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_maybe_app/domain/entities/message.dart';
import 'package:yes_no_maybe_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_maybe_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_maybe_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_maybe_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {

  const ChatScreen({super.key});

  final String _name = 'Mi diosa venezolana';

  String get name {
    return _name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('images/Screenshot_20230901-224317_WhatsApp.jpg')
            // Desde el local, no funciona
            // backgroundImage: FileImage(File('C:/Users/ruben/Pictures/Screenshot_20230901-224317_WhatsApp.jpg')),
            // Desde internet, si funciona
            // backgroundImage: NetworkImage('https://www.stylist.co.uk/images/app/uploads/2022/06/01105352/jennifer-aniston-crop-1654077521-1390x1390.jpg?w=256&fit=max&auto=format%2Ccompress'),
            // backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiHDwS00ifwoFXfqPbf7FBFGkWhM_9Ypl0EQ&usqp=CAU'),
          ),
        ),
        // title: const Text('Mi diosa venezolana'),
        title: Text(_name),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {  

  @override
  Widget build(BuildContext context) { // 'build' indica que algo se va a construir en el momento de ejecucion de ese widget

    final chatProvider = context.watch<ChatProvider>();  // va a estar pendiente (LISTENER) de los cambios que sucedan en la instancia de (el objeto) ChatProvider

    return SafeArea( // WIDGET DE FLUTTER QUE PROTEGE AUTOMATICAMENTE LAS ZONAS DE ARRIBA Y ABAJO DE MOVILES CON isla dinamica o botones
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded( // Expanded() es un widget que coge todo el espacio disponible que le deje el padre y el resto de widgets
              child: ListView.builder(
                //----------------------- Descomentar para ver el comportamiento anterior en la fase de Diseño -------------------------------------------------
                // itemCount: 100, // index, si no se controla, genera infinitos elementos Con esto estamos limitando el numero maximo de item que puede mostrar/almacenar el widget ListView
                // itemBuilder: (context, index) { // '...Builder' indica que algo se va a construir en el momento de ejecucion de ese widget
                //   return ( index % 2 == 0) // La logica simple va a ser que mire el indice y si es par muestre el chat de ella y sino el mio
                //   ? HerMessageBubble(herName: const ChatScreen().name)
                //   // ? const HerMessageBubble() // prueba para si no pongo nombre ver que funciona la condicion
                //   : const MyMessageBubble();
                // }
                //------------------------------------------------------------------------
                itemCount: chatProvider.messageList.length,
                itemBuilder:(context, index) {
                  final message = chatProvider.messageList[index];

                  return (message.fromWho == FromWho.hers)
                         ? HerMessageBubble(herName: const ChatScreen().name, message: message,)
                         : MyMessageBubble(message: message,);
                },
              )
            ),
            // Text('Mundo'),

            // Caja de texto de mensajes
            MessageFieldBox(
              // onValue: (value) => chatProvider.sendMessage(value), // Forma larga. (value) {} define una función ANONIMA/LAMBDA que toma un parámetro value y luego realiza alguna acción dentro del cuerpo de la función
              onValue: chatProvider.sendMessage, // Forma corta si los argumentos que se crean (value) son los que se tienen que enviar a la funcion

            )
          ],
        ),
      ),
    );
  }
}