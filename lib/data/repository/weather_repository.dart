import 'dart:convert';

import 'package:weather_app_bloc/data/data_provider/weather_data_provider.dart';
import 'package:weather_app_bloc/models/weather_model.dart';

/// objective of creating repositroy -> return the data in class model instead
/// of Map<String,dynamic>
class WeatherRepository {
  /// instantiation helps in unit testing
  final WeatherDataProvider weatherDataProvider;

  WeatherRepository(this.weatherDataProvider);

  Future<WeatherModel> getCurrentWeather() async {
    try {
      String cityName = 'New Delhi';
      final weatherData = await weatherDataProvider.getCurrentWeather(cityName);

      final data = jsonDecode(weatherData);

      if (data['cod'] != '200') {
        ///
        throw 'An unexpected error occurred';
      }

      /// return WeatherModel.fromJson(weatherData); // here weatherData is json
      return WeatherModel.fromMap(data); // here data is Map(in string format)
    } catch (e) {
      throw e.toString();
    }
  }
}
