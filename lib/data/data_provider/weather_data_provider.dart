import 'package:http/http.dart' as http;
import 'package:weather_app_bloc/secrets.dart';

/// data provider will get go to API and return the result
/// not parsing, not handling, not converting to model etc
class WeatherDataProvider {
  /// contains crude operations
  /// creating, deleting, reading, updating
  /// but now just fetch the weather data

  Future<String> getCurrentWeather(String cityName) async {
    try {
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKey',
        ),
      );

      return res.body; // returns the data is string
      // return res.bodyBytes; // returns Uint8bytes
    } catch (e) {
      throw e.toString();
    }
  }
}
