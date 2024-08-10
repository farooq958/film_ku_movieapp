import 'package:film_ku/data/resources/app_context.dart';
import 'package:film_ku/data/resources/app_providers.dart';
import 'package:film_ku/data/theme/app_theme.dart';
import 'package:film_ku/presentation/widgets/home_master_screen/home_master_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: appProviders, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      navigatorKey: AppContext.navigatorKey,
      theme: AppTheme().lightTheme,
      home: const HomeMasterScreen(),
    );
  }
}
