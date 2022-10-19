// import 'package:anitocorn_open_weather_cubit/respositories/weather_repository.dart';
// import 'package:anitocorn_open_weather_cubit/services/weather_api_services.dart';
// import 'package:anitocorn_open_weather_cubit/cubits/weather/weather_cubit.dart';
import 'package:anitocorn_open_weather_cubit/cubits/weather/weather_cubit.dart';
import 'package:anitocorn_open_weather_cubit/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _city;
  // @override
  // void initState() {
  //   _fetchWeather();
  //   super.initState();
  // }

  // _fetchWeather() {
  //   context.read<WeatherCubit>().fetchWeather('London');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              _city = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchPage();
                  },
                ),
              );
              print('city:$_city');
              if (_city != null) {
                context.read<WeatherCubit>().fetchWeather(_city!);
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
