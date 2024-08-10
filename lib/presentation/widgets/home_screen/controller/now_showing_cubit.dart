import 'package:bloc/bloc.dart';
import 'package:film_ku/data/repositories/now_showing_repo.dart';
import 'package:film_ku/domain/movie_model.dart';
import 'package:meta/meta.dart';

part 'now_showing_state.dart';

class NowShowingCubit extends Cubit<NowShowingState> {
  NowShowingCubit() : super(NowShowingInitial());


  int pageNo = 1;
  bool isLoading = false;
  List<MovieModel> nowDataController=[];

  getNowShowing({int? pageNo,bool? isLoad}) async {
     if(isLoading) return;
    await Future.delayed(const Duration(milliseconds: 30));

   if(isLoad==null){ emit(NowShowingLoading());}
try {
     isLoading = true;
     // pageNo =this.pageNo++;
  await NowShowingRepo().getNowShowingMovies(this.pageNo ?? 1).then((value) {
    if (value['Success']) {
      print("here in ");
      int totalPage = value['body']['total_pages'];
      if (totalPage > this.pageNo) {
        this.pageNo++;
      }
      List<MovieModel> nowShowingDto = List<MovieModel>.from(
          value['body']['results'].map((x) => MovieModel.fromJson(x)));
 nowDataController.addAll(nowShowingDto);
  isLoading = false;
      emit(NowShowingLoaded(nowDataController));
    }
    else {
      isLoading=false;
      emit(NowShowingError());
    }
  }).catchError((e) {
    isLoading=false;
    throw e;
    emit(NowShowingError());
  });
}
catch (e) {
      isLoading=false;
     rethrow;
}
  }



}
