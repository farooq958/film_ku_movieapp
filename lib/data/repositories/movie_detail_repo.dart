import 'package:film_ku/application/services/api_services/api_services.dart';
import 'package:film_ku/data/resources/api_routes.dart';

class MovieDetailRepo {


  Future<Map<String,dynamic>> getMovie(int id) async {
    try{
      return await ApiService.get(ApiRoutes.getMovie+id.toString()).then((value){

        return value;
      }).catchError((e){
        throw e;
      });
    }catch(e){
      rethrow;
    }
  }
}