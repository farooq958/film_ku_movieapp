import 'package:film_ku/application/services/api_services/api_services.dart';
import 'package:film_ku/data/resources/api_routes.dart';

class GenreRepo {


  static Future<Map<String,dynamic>> getGenre() async {
    try{
      return await ApiService.get(ApiRoutes.getGenre).then((value){

        return value;
      }).catchError((e){
        throw e;
      });
    }catch(e){
      rethrow;
    }
  }
}