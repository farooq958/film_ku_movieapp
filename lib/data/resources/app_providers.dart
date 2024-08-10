import 'package:film_ku/presentation/widgets/home_screen/controller/now_showing_cubit.dart';
import 'package:film_ku/presentation/widgets/home_screen/controller/poupular_cubit.dart';
import 'package:film_ku/presentation/widgets/home_screen/movie_detail/controller/movie_detail_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> appProviders = [
  BlocProvider<NowShowingCubit>(create: (context) => NowShowingCubit()),

  BlocProvider<PopularCubit>(create: (context) => PopularCubit()),
  BlocProvider<MovieDetailCubit>(create: (context) => MovieDetailCubit()),


];