part of 'movie_detail_cubit.dart';

@immutable
sealed class MovieDetailState {}

final class MovieDetailInitial extends MovieDetailState {}

final class MovieDetailLoading extends MovieDetailState {}
final class MovieDetailLoaded extends MovieDetailState {

  final MovieDetailModel movieDetailModel;
  MovieDetailLoaded(this.movieDetailModel);

}
final class MovieDetailError extends MovieDetailState {}

