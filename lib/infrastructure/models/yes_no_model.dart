//* CODIGO QUE GENERA QUICKTYPE.IO, SUPERCOMPLETO
// To parse this JSON data, do
//
//     final yesNoModel = yesNoModelFromJson(jsonString);

import 'dart:convert';

import 'package:yes_no_maybe_app/domain/entities/message.dart';

YesNoModel yesNoModelFromJson(String str) => YesNoModel.fromJsonMap(json.decode(str)); // sin uso en este codigo pero útil

String yesNoModelToJson(YesNoModel data) => json.encode(data.toJson());  // sin uso en este codigo pero útil

class YesNoModel {
    final String answer;
    final bool forced;
    final String image;

    YesNoModel({
        required this.answer,
        required this.forced,
        required this.image,
    });

    factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
    };

    // esto ya no lo genera el QuickType.io. Podemos aprovechar para generar desde aqui una instancia del mensaje
    Message toMessageEntity() => Message(
      text: answer == 'yes' ? 'Sí' : 'No', 
      fromWho: FromWho.hers, 
      imageUrl: image
    );
}
