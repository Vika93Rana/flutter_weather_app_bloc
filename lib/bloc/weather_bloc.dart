import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app_bloc/data/repository/weather_repository.dart';
import 'package:weather_app_bloc/models/weather_model.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  ///B_usiness Lo_gic C_omponent
  ///it helps in
  ///1. Sepatation of Concerns
  ///2. Testability
  ///3. Scalability
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) : super(WeatherInitialState()) {
    on<WeatherFetched>(_getCurrentWeather);
  }

  void _getCurrentWeather(
      WeatherFetched event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      final weather = await weatherRepository.getCurrentWeather();
      emit(WeatherSuccess(weather));
    } catch (e) {
      emit(WeatherFailure(e.toString()));
    }
  }
}
