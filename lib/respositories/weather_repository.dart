// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:anitocorn_open_weather_cubit/exceptions/weather_exception.dart';
import 'package:anitocorn_open_weather_cubit/models/custom_error.dart';
import 'package:anitocorn_open_weather_cubit/models/direct_geocoding.dart';
import 'package:anitocorn_open_weather_cubit/models/weather.dart';
import 'package:anitocorn_open_weather_cubit/services/weather_api_services.dart';

class WeatherRepository {
  final WeatherApiSevices weatherApiSevices;
  WeatherRepository({
    required this.weatherApiSevices,
  });

  Future<Weather> fetchWeather(String city) async {
    try {
      final DirectGeocoding directGeocoding =
          await weatherApiSevices.getDirectGeocoding(city);
      print('directGeocoding: $directGeocoding');

      final Weather tempWeather =
          await weatherApiSevices.getWeather(directGeocoding);
      print('tempWeather: $tempWeather');

      final Weather weather = tempWeather.copyWith(
        name: directGeocoding.name,
        country: directGeocoding.country,
      );

      return weather;
    } on WeatherException catch (e) {
      throw CustomError(errMsg: e.message);
    } catch (e) {
      throw CustomError(errMsg: e.toString());
    }
  }
}