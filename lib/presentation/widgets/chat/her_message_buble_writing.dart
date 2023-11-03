import 'package:flutter/material.dart';
import 'package:yes_no_maybe_app/domain/entities/message.dart';

class HerMessageBubbleWriting extends StatelessWidget {

  final String? herName;
  final Message message;

  const HerMessageBubbleWriting({
    super.key,
    this.herName, 
    required this.message
    });

  @override
  Widget build(BuildContext context) { // 'build' indica que algo se va a construir en el momento de ejecucion de ese widget

    final colors = Theme.of(context).colorScheme; // Esto significa: vete para atras en los widgets padres hasta que encuentres el Theme y aplicalo. Para esto esta el argumento "BuildContext context" en todos los Widgets
                                                  // con .colorScheme accedemos a todo lo definido en AppTheme()
    final size = MediaQuery.of(context).size; // FORMA DE SABER LAS DIMENSIONES DEL DISPOSITIVO MOVIL EN USO
    // MediaQuery - da info sobre el dispositivo que esta ejecutando la aplicacion
    // context - hace referencia del arbol de widgets padre "BuildContext context"
    // print(size);    
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // PARA ALINEAR sus BURBUJAS DE CHAT A LA izquierda
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.tertiary, // el color definido en AppTheme(), pero el segundo
            borderRadius: BorderRadius.circular(20)
          ),
          width: size.width * 0.7,          
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            //----------------------- Descomentar para ver el comportamiento anterior en la fase de Diseño -------------------------------------------------
            // child: Text(
            //   'Hola soy Pau',
            //   style: TextStyle( color: Colors.white),),
            //----------------------------------------------------------------------------            
            child: Text(
              '$herName ${message.text}',
              style: const TextStyle( color: Colors.white),),
          ),
        )
      ],
    );
  }
}