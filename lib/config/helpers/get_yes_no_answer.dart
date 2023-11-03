import 'package:dio/dio.dart';
import 'package:yes_no_maybe_app/domain/entities/message.dart';

class GetYesNoAnswer{

  final _dio = Dio();

  Future<Message> getAnswer() async {

    final response = await _dio.get('https://yesno.wtf/api');    
    // MAPPERS - se toman los datos de una fuente de cierta manera (de la API de la web en este caso) y se devuelve de otra manera.
    return Message(
      text: response.data['answer'], 
      fromWho: FromWho.hers, 
      imageUrl: response.data['image']
    );
  }

}