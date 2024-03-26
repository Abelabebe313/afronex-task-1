part of 'wheather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
  @override
  List<Object> get props => [];
}

class FetchWeatherEvent extends WeatherEvent {
  final String location;
  const FetchWeatherEvent(this.location);
  @override
  List<Object> get props => [location];
}