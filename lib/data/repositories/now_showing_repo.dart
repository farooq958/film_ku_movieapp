import 'package:film_ku/application/services/api_services/api_services.dart';
import 'package:film_ku/data/resources/api_routes.dart';

class NowShowingRepo {


  Future<Map<String,dynamic>> getNowShowingMovies(int pageNo) async {
    try{
      return await ApiService.get(ApiRoutes.nowPlaying+pageNo.toString()).then((value){

        return value;
      }).catchError((e){
        throw e;
      });
    }catch(e){
      rethrow;
    }
  }
}