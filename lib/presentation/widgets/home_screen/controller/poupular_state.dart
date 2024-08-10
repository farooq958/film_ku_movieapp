part of 'poupular_cubit.dart';

@immutable
sealed class PopularState {}

final class PopularInitial extends PopularState {}
final class PopularLoading extends PopularState {}
final class PopularLoaded extends PopularState {
  final List<MovieModel> popularDto;

  PopularLoaded(this.popularDto);

}
final class PopularError extends PopularState {}
