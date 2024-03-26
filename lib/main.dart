import 'package:afronex_task_1/features/wheather/data/models/weather_adapter.dart';
import 'package:afronex_task_1/presentation/bloc/wheather_bloc.dart';
import 'package:afronex_task_1/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';


const weather = 'weather';
void main() async {
  await Hive.initFlutter();
  // Register Hive adapter
  Hive.registerAdapter(WeatherModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>(
      create: (context) => WeatherBloc(),
      child: const MaterialApp(
        title: 'Weather App',
        debugShowCheckedModeBanner: false,
        home: Splash(),
      ),
    );
  }
}
