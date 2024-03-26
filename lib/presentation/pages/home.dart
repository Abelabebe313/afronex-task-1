import 'dart:async';
import 'dart:convert';

import 'package:afronex_task_1/features/wheather/data/models/weather_model.dart';
import 'package:afronex_task_1/presentation/bloc/wheather_bloc.dart';
import 'package:afronex_task_1/presentation/widgets/next_weather.dart';
import 'package:afronex_task_1/presentation/widgets/todays_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isLoading = false;
  TextEditingController locationController = TextEditingController();
  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<WeatherBloc>(context).add(FetchWeatherEvent('Addis'));
  }

  Future<WeatherModel> fetchWeatherData(String city) async {
    String baseUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=4ebc4d4ca27bb7f37d53514a74ae6bee&units=metric';

    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      return WeatherModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherBloc, WeatherState>(
      listener: (context, state) async {
        if (state is WeatherDataLoaded) {
          setState(() {
            _isLoading = false;
          });
        }
        // loading state
        else if (state is WeatherLoading) {
          setState(() {
            _isLoading = true;
          });
        } else if (state is WeatherError) {
          // Handle error if signup fails
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        return buildBody(context, state);
      },
    );
  }

  Widget buildBody(BuildContext context, WeatherState state) {
    if (state is WeatherDataLoaded) {
      WeatherModel weatherData = state.weather;
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF08244F),
                Color(0xFF0B42AB),
              ],
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '${weatherData.name ?? ''}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 220,
                  width: 250,
                  child: ClipRRect(
                    child: Lottie.asset(
                      'assets/lotties/1.json',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Temp Data displated below
                Text(
                  ' ${weatherData.main?.temp ?? ''}°',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Precipitations',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Max:  ${weatherData.main?.tempMax ?? ''}°',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    Text(
                      'Min:  ${weatherData.main?.tempMin ?? ''}°',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                // temp // humdity // wind speed
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFF001026).withOpacity(0.4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 30,
                      ),

                      // humidity
                      const Icon(
                        Icons.water_drop_sharp,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        ' ${weatherData.main?.humidity ?? ''}°%',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      const Spacer(),
                      // temp speed
                      const Icon(
                        Icons.thermostat_outlined,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${weatherData.main?.pressure ?? ''}',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      const Spacer(),

                      // ==== wind speed =====
                      //
                      const Icon(
                        Icons.air_outlined,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${weatherData.wind?.speed ?? ''}km/h',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                    ],
                  ),
                ),
                //
                //
                // Todays wheather
                const SizedBox(height: 20),
                const TodayWeatherWidgets(),
                //
                //
                // Next wheathers
                const SizedBox(height: 20),
                const NextWeatherWidget(),
                //
                //
                // Add location
                const SizedBox(height: 40),
                Container(
                  height: 220,
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF001026).withOpacity(0.4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            'City',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 180,
                            child: TextField(
                              controller: locationController,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: const InputDecoration(
                                hintText: 'Enter City',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () async {
                          String inputLocation = locationController.text;
                          BlocProvider.of<WeatherBloc>(context)
                              .add(FetchWeatherEvent(inputLocation));
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF0B42AB),
                          ), // Change the background color here
                        ),
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      );
    } else {
      // Placeholder for when weather data is loading or in error state
      return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF08244F),
                Color(0xFF0B42AB),
              ],
            ),
          ),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
  }
}
