enum FromWho { mine, hers }

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;
  // Se puede ampliar esta entidad con cosas como: fecha de recibo/leido, doble tick si leido, etc (vamos, un Whatsapp)

  Message({
    required this.text, 
    this.imageUrl, 
    required this.fromWho
    });


}