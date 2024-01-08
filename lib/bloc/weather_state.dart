part of 'weather_bloc.dart';

@immutable
sealed class WeatherState{

}

/// initial state must be created to pass in bloc super constructor
final class WeatherInitialState extends WeatherState{}

final class WeatherSuccess extends WeatherState{
  final WeatherModel model;

  WeatherSuccess(this.model);


}
final class WeatherFailure extends WeatherState{
  final String error;

  WeatherFailure(this.error);

}
final class WeatherLoading extends WeatherState{

}

