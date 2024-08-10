import 'package:bloc/bloc.dart';
import 'package:film_ku/data/repositories/popular_repo.dart';
import 'package:film_ku/domain/movie_model.dart';
import 'package:meta/meta.dart';

part 'poupular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit() : super(PopularInitial());

  int pageNo = 1;
  bool isLoading = false;
  List<MovieModel> popularDto=[];

  getPopular({int? pageNo,bool? isLoad}) async {
    if(isLoading) return;
    await Future.delayed(const Duration(milliseconds: 30));

    if(isLoad==null){ emit(PopularLoading());}
    try {
      isLoading = true;
      // pageNo =this.pageNo++;
      await PopularRepo().getPopular(this.pageNo ?? 1).then((value) {
        if (value['Success']) {
          print("here in ");
          int totalPage = value['body']['total_pages'];
          if (totalPage > this.pageNo) {
            this.pageNo++;
          }
          List<MovieModel> nowShowingDto = List<MovieModel>.from(
              value['body']['results'].map((x) => MovieModel.fromJson(x)));
          popularDto.addAll(nowShowingDto);
          isLoading = false;
          emit(PopularLoaded(popularDto));
        }
        else {
          isLoading=false;
          emit(PopularError());
        }
      }).catchError((e) {
        isLoading=false;
        emit(PopularError());

        throw e;

      });
    }
    catch (e) {
      isLoading=false;
      rethrow;
    }
  }
}
