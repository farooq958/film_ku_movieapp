import 'package:bloc/bloc.dart';
import 'package:film_ku/data/repositories/movie_detail_repo.dart';
import 'package:film_ku/domain/movie_detail_model.dart';
import 'package:meta/meta.dart';

part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieDetailCubit() : super(MovieDetailInitial());

  getMovieById(int id) async {

    await Future.delayed(const Duration(milliseconds: 30));

    emit(MovieDetailLoading());
    try {

      // pageNo =this.pageNo++;
      await MovieDetailRepo().getMovie(id).then((value) {
        if (value['Success']) {
          print("here in ");


          MovieDetailModel movieDto = MovieDetailModel.fromJson(value['body']);

          emit(MovieDetailLoaded(movieDto));
        }
        else {
          emit(MovieDetailError());
        }
      }).catchError((e) {
        emit(MovieDetailError());
        throw e;
        //emit(NowShowingError());
      });
    }
    catch (e) {
      emit(MovieDetailError());
      rethrow;
    }
  }
}
