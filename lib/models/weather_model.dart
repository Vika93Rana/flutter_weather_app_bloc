class WeatherModel{
  final double currentTemp;
  final String currentSky;
  final double currentPressure;
  final double currentWindSpeed;
  final double currentHumidity;

  Map<String, dynamic> toMap() {
    return {
      'currentTemp': this.currentTemp,
      'currentSky': this.currentSky,
      'currentPressure': this.currentPressure,
      'currentWindSpeed': this.currentWindSpeed,
      'currentHumidity': this.currentHumidity,
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {

    final currentWeatherData = map['list'][0];
    return WeatherModel(
      currentTemp:currentWeatherData['main']['temp'],
      currentSky: currentWeatherData['weather'][0]['main'],
      currentPressure:currentWeatherData['main']['pressure'],
      currentWindSpeed:currentWeatherData['wind']['speed'],
      currentHumidity:currentWeatherData['main']['humidity'],
    );
  }

  const WeatherModel({
    required this.currentTemp,
    required this.currentSky,
    required this.currentPressure,
    required this.currentWindSpeed,
    required this.currentHumidity,
  });
}