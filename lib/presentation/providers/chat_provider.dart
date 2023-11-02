import 'package:flutter/material.dart';
import 'package:yes_no_maybe_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

  List<Message> messageList = [
    Message(text: 'Hola amor!', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {
    // El mensaje que se va a enviar a traves del chat siempre va a ser mio
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);
    // El mensaje de respuesta de ella va a ser automatico (un meme)

    notifyListeners();// es lo mismo que el setState({}) para los widgets. Sirve para avisar de que algo cambio (en el provider) y que hay que redibujar el widget (reenderizarlo de nuevo)
    // En este caso el listener esta en 'chat_screen.dart', linea: final chatProvider = context.watch<ChatProvider>();
  }

}