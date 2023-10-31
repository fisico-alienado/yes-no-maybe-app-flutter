// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:yes_no_maybe_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_maybe_app/presentation/widgets/chat/my_message_bubble.dart';

class ChatScreen extends StatelessWidget {

  const ChatScreen({super.key});

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
        title: const Text('Mi diosa venezolana'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea( // WIDGET DE FLUTTER QUE PROTEGE AUTOMATICAMENTE LAS ZONAS DE ARRIBA Y ABAJO DE MOVILES CON isla dinamica o botones
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded( // Expanded() es un widget que coge todo el espacio disponible que le deje el padre y el resto de widgets
              child: ListView.builder(
                itemCount: 100, // Con esto estamos limitando el numero maximo de item que puede mostrar/almacenar el widget ListView
                itemBuilder: (context, index) { // index, si no se controla, genera infinitos elementos
                  return ( index % 2 == 0) // La logica simple va a ser que mire el indice y si es par muestre el chat de ella y sino el mio
                  ? const HerMessageBubble()
                  : const MyMessageBubble();
                }
              )
            ),
            const Text('Hola')
          ],
        ),
      ),
    );
  }
}