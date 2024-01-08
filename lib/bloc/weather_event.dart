part of 'weather_bloc.dart';

/// now Dart since version 3. A sealed class cannot
/// be extended outside of its library (file). This
/// restriction allows the compiler to benefit from it
@immutable
sealed class WeatherEvent{

}
/// events should be named in past tense
final class WeatherFetched extends WeatherEvent{

}