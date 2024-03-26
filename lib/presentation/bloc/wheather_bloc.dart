import 'dart:convert';

import 'package:afronex_task_1/features/wheather/data/models/weather_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'wheather_event.dart';
part 'wheather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {

    on<FetchWeatherEvent>((event, emit) async{
      print('=====>>Bloc begin here << ========');
      emit(WeatherLoading());
      print('=====>>loading state called');

      try {
        final WeatherModel weatherData = await fetchWeatherData(event.location);
        emit(WeatherDataLoaded(weather: weatherData));
      } catch (error) {
        emit(WeatherError(message: 'Error fetching weather data: $error'));
      }
      

    });
  }
}

  Future<WeatherModel> fetchWeatherData(String city) async {
    String baseUrl = 'https://api.openweathermap.org/data/2.5/weather?q=$city&APPID={enter-your-key}&units=metric';

    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      return WeatherModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load weather data');
    }
  }