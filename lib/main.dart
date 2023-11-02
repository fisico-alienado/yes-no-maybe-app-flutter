import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:yes_no_maybe_app/config/theme/app_theme.dart';
import 'package:yes_no_maybe_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_maybe_app/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider( 
      // en este caso, el gestor de estado PROVIDER tiene que estar al tanto de todos los hijos de la app y por eso lo ponemos lo mas alto posible en el organigrama de jerarquia
      // Usamos 'MultiProvider' porque puede que tengamos de un proveedor/clase de informacion y este widget permite añadir varios (por ejemplo, autentificacion, gestor de temas, chat, etc)
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()) // si no se necesita el argumento, en este caso 'context', pero es obligatorio ponerlo, se puede poner "_"
        // * AL HABER ENVUELTO TODA LA APP CON ESTE PROVEEDOR, TODOS LO WIDGETS HIJOS DE MyApp() tienen acceso al provider ChatProvider()
      ],
      child: MaterialApp(
        title: 'Yes No Maybe App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 1).theme(),
        home: const ChatScreen()
        // home: Scaffold(
        //   appBar: AppBar(
        //     title: const Text('Yes No Maybe App Bar'),
        //   ),
        //   body: Center(
        //     child: FilledButton.tonal(
        //       onPressed: (){ }, 
        //       child: const Text('Click me')
        //     ),
        //   ),
        // ),
      ),
    );
  }
}