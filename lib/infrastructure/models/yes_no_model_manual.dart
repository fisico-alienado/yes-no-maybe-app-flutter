// tener todas las propiedades que vienen del httpGet de la web https://yesno.wtf
// {
//   "answer": "yes",
//   "forced": false,
//   "image": "https://yesno.wtf/assets/yes/2.gif"
// }

class YesNoModel {

// Esto es valido para una respuesta json sencilla con 3 campos y aun asi hubo que escribir mucho codigo. Pero que pasa si hay mas campos, o hay objetos anidados, etc
// Hay paginas como QuickType.io (https://app.quicktype.io/) que permiten rapidamente coger el json y transformarlo al lenguaje de programacion que estemos usando.
  String answer;
  bool forced;
  String image;

  YesNoModel({required this.answer, required this.forced, required this.image});
  // Un constructor de fábrica ("factory") es un tipo especial de constructor que no crea una nueva instancia de la clase cuando se llama, 
  // sino que devuelve una instancia existente o crea una nueva instancia basada en alguna lógica con otro constructor (como va a ser este caso).
  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => 
  YesNoModel(
    answer: json['answer'], 
    forced: json['forced'], 
    image: json['image']
  );
}