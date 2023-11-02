import 'package:flutter/material.dart';
import 'package:yes_no_maybe_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

  final ScrollController chatScrollController = ScrollController();  // Widget que nos va a permitir tener el control de UN scroll controller

  List<Message> messageList = [
    Message(text: 'Hola amor!', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return; // Si el mensaje esta vacio, no enviarlo

    // El mensaje que se va a enviar a traves del chat siempre va a ser mio
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);
    // El mensaje de respuesta de ella va a ser automatico (un meme)

    notifyListeners();// es lo mismo que el setState({}) para los widgets. Sirve para avisar de que algo cambio (en el provider) y que hay que redibujar el widget (reenderizarlo de nuevo)
    // En este caso el listener esta en 'chat_screen.dart', linea: final chatProvider = context.watch<ChatProvider>();
    moveScrollToBottom();
  }

  void moveScrollToBottom(){
    // Cuando los mensajes lleguen al final de la pantalla, que haga scroll automatico para tener visibles los mensajes mas recientes (como Whatsapp)
    chatScrollController.animateTo( // animar cuando baja el scroll de forma automatica
      chatScrollController.position.maxScrollExtent, // que el movimiento tenga lugar hasta lo maximo que ese scroll pueda dar (si no hay mensajes suficientes para bajar, no baja)
      duration: const Duration( milliseconds: 300), 
      curve: Curves.easeOut
    );
  }
}