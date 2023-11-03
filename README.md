# Aplicación de Flutter: Yes/No/Maybe app

Podemos dividir la creación de una aplicación de flutter en tres partes:

1. La construcción de la lógica de negocio.
2. La conexión entre la lógica de negocio y los widgets/diseño.
3. Creación del diseño de la aplicación.

El punto `3` depende lo que hayamos pensado sobre `1`, es decir, la función que tenga que cumplir la app. Lo primero que se ha hecho
es pensar en qué queremos que haga la aplicación, lo cual hace el instructor. Luego el desarrollo consta de dos partes: Diseño de la aplicación (lo primero) e implementación de la funcionalidad del chat (tras el diseño). ¿Qué se hace/aprende en cada una de ellas?

## Diseño de la aplicación

- TextEditingControllers

- Focus Nodes

- ThemeData

- Widgets como:

  - Containers
  - SizeBox
  - ListViews
  - CustomWidgets
  - Expanded
  - Padding
  - Image (desde internet)
  - ClipRRect (bordes redondeados)

## Implementación de la funcionalidad

- Gestores de estado
- Mappers
- Peticiones HTTP, con los paquetes de pub.dev:
  - http (simplemente saber que existe y se puede usar)
  - Dio ( el que se va a **usar** tiene menos dependencias que el paquete 'http' y es mas ligero)
- Paquetes
- Funciones que retornan valores como callbacks
- Scroll
- Provider

Con esto tendremos una buena base de como alojar el estado fuera de los widgets y que los widgets se actualicen y tomen la información que necesitan del gestor de estado.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
