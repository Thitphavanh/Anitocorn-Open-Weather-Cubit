// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:anitocorn_open_weather_cubit/constants/constants.dart';
import 'package:anitocorn_open_weather_cubit/exceptions/weather_exception.dart';
import 'package:anitocorn_open_weather_cubit/models/direct_geocoding.dart';
import 'package:anitocorn_open_weather_cubit/services/http_error_handler.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class WeatherApiSevices {
  final http.Client httpClient;
  WeatherApiSevices({
    required this.httpClient,
  });

  Future<DirectGeocoding> getDirectGeocoding(String city) async {
    final Uri uri = Uri(
      scheme: 'https',
      host: kApiHost,
      path: '/geo/1.0/direct',
      queryParameters: {
        'q': city,
        'limit': kLimit,
        'appid': dotenv.env['APPID'],
      },
    );

    try {
      final http.Response response = await httpClient.get(uri);

      if (response.statusCode != 200) {
        throw httpErrorHandler(response);
      }

      final responseBody = json.decode(response.body);

      if (responseBody.isEmpty) {
        throw WeatherException('Cannot get the location of $city');
      }
      final directGeocoding = DirectGeocoding.fromJson(responseBody);

      return directGeocoding;
    } catch (e) {
      rethrow;
    }
  }
}
