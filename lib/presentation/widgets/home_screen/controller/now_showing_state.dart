part of 'now_showing_cubit.dart';

@immutable
sealed class NowShowingState {}

final class NowShowingInitial extends NowShowingState {}
final class NowShowingLoading extends NowShowingState {}
final class NowShowingLoaded extends NowShowingState {

  final List<MovieModel> nowShowingModel;

  NowShowingLoaded(this.nowShowingModel);

}
final class NowShowingError extends NowShowingState {}
