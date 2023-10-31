import 'package:flutter/material.dart';

class MyMessageBubble extends StatelessWidget {
  const MyMessageBubble({super.key});

  @override
  Widget build(BuildContext context) { // 'build' indica que algo se va a construir en el momento de ejecucion de ese widget

    final colors = Theme.of(context).colorScheme; // Esto significa: vete para atras en los widgets padres hasta que encuentres el Theme y aplicalo. Para esto esta el argumento "BuildContext context" en todos los Widgets
                                                  // con .colorScheme accedemos a todo lo definido en AppTheme()
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end, // PARA ALINEAR MIS BURBUJAS DE CHAT A LA DERECHA
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primary, // el color definido en AppTheme()
            borderRadius: BorderRadius.circular(20)
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Ipsum excepteur sunt occaecat p', style: TextStyle( color: Colors.white),),
          ),
        ),
        // Para agregar una SEPARACION
        const SizedBox(height: 10),
      ],
    );
  }
}