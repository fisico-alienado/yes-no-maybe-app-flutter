import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {

  final String? herName;

  const HerMessageBubble({
    super.key,
    this.herName
    });

  @override
  Widget build(BuildContext context) { // 'build' indica que algo se va a construir en el momento de ejecucion de ese widget

    final colors = Theme.of(context).colorScheme; // Esto significa: vete para atras en los widgets padres hasta que encuentres el Theme y aplicalo. Para esto esta el argumento "BuildContext context" en todos los Widgets
                                                  // con .colorScheme accedemos a todo lo definido en AppTheme()
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // PARA ALINEAR sus BURBUJAS DE CHAT A LA izquierda
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary, // el color definido en AppTheme(), pero el segundo
            borderRadius: BorderRadius.circular(20)
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Hola soy Pau',
              style: TextStyle( color: Colors.white),),
          ),
        ),
        // Para agregar una SEPARACION
        const SizedBox(height: 5),

        _ImageBubble(herName: herName),

        // Para agregar una SEPARACION
        const SizedBox(height: 10),        

        // Todo: imagen
      ],
    );
  }
}

// LO PONGO COMO CLASE PRIVADA '_' porque solo se va a usar este widget en este .dart
class _ImageBubble extends StatelessWidget {

  final String? herName;

  const _ImageBubble({
    this.herName
    });

  String loadingImage({String? name}){
    return (name != null && name.isNotEmpty) ? '$name está enviando una imagen' : 'Enviando imagen...';
  }

  @override
  Widget build(BuildContext context) { // 'build' indica que algo se va a construir en el momento de ejecucion de ese widget

    final size = MediaQuery.of(context).size; // FORMA DE SABER LAS DIMENSIONES DEL DISPOSITIVO MOVIL EN USO
    // MediaQuery - da info sobre el dispositivo que esta ejecutando la aplicacion
    // context - hace referencia del arbol de widgets padre "BuildContext context"
    // print(size);

    // return Placeholder(); // WIDGET que ayuda a ver las DIMENSIONES
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        'https://yesno.wtf/assets/yes/15-3d723ea13af91839a671d4791fc53dcc.gif',
        width: size.width * 0.7, // 70% de la anchura disponible
        height: 150, // dejamos la altura fija en este caso
        fit: BoxFit.cover, // en funcion de las dimensiones que te estoy especificando con width y height, ajustate a ellas y aplica las propiedades que haya definido previamente, como los bordes redondeados
        loadingBuilder: (context, child, loadingProgress) {  // '...Builder' indica que algo se va a construir en el momento de ejecucion de ese widget

          if (loadingProgress == null) return child; // si el progreso ha terminado y ha cargado la imagen ('null') muestrala (child)

          return Container( // mientras se esta cargando la imagen, devuelve un container con otra cosa de las mismas dimensiones que la imagen que se va a cargar
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 5),
            // child: Text(herName ?? 'Enviando imagen...'), // tambien valido
            child: Text(loadingImage(name: herName)),
          );
        },
      )); // https://yesno.wtf/api
  }
}