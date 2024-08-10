import 'package:film_ku/data/repositories/genre_repo.dart';
import 'package:film_ku/data/resources/app_context.dart';
import 'package:film_ku/domain/genre_model.dart';
import 'package:film_ku/presentation/common/widget_functions.dart';
import 'package:flutter/cupertino.dart';

class  GenreController  with ChangeNotifier{

  //DirectoryController();
static  ValueNotifier<int> genreLoading = ValueNotifier(0);
static  ValueNotifier<List<GenreModel>> genreDto = ValueNotifier([]);

  Future getGenres() async {
    try {
      genreLoading.value = 1;

      await GenreRepo.getGenre().then((value) async {
        if (value['Success'] == true) {
          List<GenreModel> dto =
          List.from(value['body']["genres"].map((x) => GenreModel.fromJson(x)));

          genreDto.value = dto;
          genreDto.notifyListeners();
          genreLoading.value = 2;
        } else {
          genreLoading.value = 3;
          //errorDto.value=value['body'];
          WidgetFunctions.instance.snackBar(
              AppContext.navigatorKey.currentContext!,
              text: value['error']);
        }
      });
    } catch (e) {
      genreLoading.value = 3;
      WidgetFunctions.instance.snackBar(AppContext.navigatorKey.currentContext!,
          text: "Something went Wrong");
      rethrow;
      // errorDto.value=e.toString();
    }
  }
}
