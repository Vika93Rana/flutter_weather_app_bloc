import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/app_bloc_observer.dart';
import 'package:weather_app_bloc/bloc/weather_bloc.dart';
import 'package:weather_app_bloc/data/data_provider/weather_data_provider.dart';
import 'package:weather_app_bloc/data/repository/weather_repository.dart';
import 'package:weather_app_bloc/presentation/screens/weather_screen.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// RepositoryProvider is from bloc pkg
    /// it, as the name, helps in providing single and multiple
    /// repository to bloc
    return RepositoryProvider(
      create: (context) => WeatherRepository(WeatherDataProvider()),
      child: BlocProvider(
        /// to get the instance of particular repo using the generics
        create: (context) => WeatherBloc(context.read<WeatherRepository>()),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          home: const WeatherScreen(),
        ),
      ),
    );
  }
}
