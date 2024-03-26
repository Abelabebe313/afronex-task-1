import 'package:afronex_task_1/presentation/bloc/wheather_bloc.dart';
import 'package:afronex_task_1/presentation/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    // fetchData();
    checkFirstVisit();
  }

  void fetchData() {
    context.read<WeatherBloc>().add(FetchWeatherEvent('Addis'));
  }

  Future<void> checkFirstVisit() async {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF08244F),
            Color(0xFF0B42AB),
          ],
        )),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // margin: const EdgeInsets.only(bottom: 50),
        child: Center(
          child: SizedBox(
            height: 220,
            width: 250,
            child: ClipRRect(
              child: Lottie.asset(
                'assets/lotties/2.json',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
