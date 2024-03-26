part of 'wheather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();  

  @override
  List<Object> get props => [];

  get allTopicsModel => null;
}
class WeatherInitial extends WeatherState {}
class WeatherLoading extends WeatherState {}
class WeatherError extends WeatherState {
  final String message;

  const WeatherError({required this.message});
  @override
  List<Object> get props => [message];
}
class WeatherDataLoaded extends WeatherState {
  final WeatherModel weather;

  const WeatherDataLoaded({required this.weather});
  @override
  List<Object> get props => [weather];
}
