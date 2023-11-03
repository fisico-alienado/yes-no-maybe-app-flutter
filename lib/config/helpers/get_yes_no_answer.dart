import 'package:dio/dio.dart';
import 'package:yes_no_maybe_app/domain/entities/message.dart';
import 'package:yes_no_maybe_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer{

  final _dio = Dio();

  Future<Message> getAnswer() async {

    final response = await _dio.get('https://yesno.wtf/api');    
    
    // Forma 1: Sin Mappers
    // return Message(
    //   text: response.data['answer'], 
    //   fromWho: FromWho.hers, 
    //   imageUrl: response.data['image']
    // );

    // Forma 2: con MAPPERS - se toman los datos de una fuente de cierta manera (de la API de la web en este caso) y se devuelve de otra manera.
    final YesNoModel yesNoModel = YesNoModel.fromJsonMap(response.data);

    // return Message(
    //   text: yesNoModel.answer, 
    //   fromWho: FromWho.hers, 
    //   imageUrl: yesNoModel.image
    // );

    // Forma 3: con mapper que ya implementa el mensaje directamente con una función
    return yesNoModel.toMessageEntity();
  }

}