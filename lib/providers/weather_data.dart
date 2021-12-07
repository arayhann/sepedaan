import 'dart:convert';

import 'package:sepedaan/models/weather_main.dart';
import 'package:sepedaan/models/weather.dart';
import 'package:riverpod/riverpod.dart';
import 'package:dio/dio.dart';

class WeatherData {
  WeatherData({
    required this.weather,
    required this.main,
    required this.timezone,
    required this.name,
    required this.weatherCondition,
  });

  List<Weather> weather;
  Main? main;
  int timezone;
  String name;
  String weatherCondition;

  factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
      weather:
          List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
      main: Main.fromJson(json["main"]),
      timezone: json["timezone"],
      name: json["name"],
      weatherCondition: weatherConditionChooser(
          List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x)))));

  static String weatherConditionChooser(List<Weather> weathers) {
    if (weathers.isEmpty) {
      return 'cloudy';
    }
    switch (weathers[0].main) {
      case 'Clouds':
        return 'cloudy';
      case 'Clear':
        return 'clear';
      case 'Snow':
        return 'rain';
      case 'Rain':
        return 'rain';
      case 'Thunderstorm':
        return 'rain';
      case 'Drizzle':
        return 'drizzle';
      default:
        return 'clear';
    }
  }
}

final weatherDataProvider =
    StateNotifierProvider<WeatherDataNotifier, WeatherData?>((ref) {
  return WeatherDataNotifier();
});

class WeatherDataNotifier extends StateNotifier<WeatherData?> {
  WeatherDataNotifier() : super(null);

  Future<void> getWeatherData(
      {required double lat, required double lng}) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lng&appid=e9e5b9c95e99702490396597644c7504&units=metric';

    try {
      final response = await Dio().get(url);

      print(response.data);

      state = WeatherData.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }
}
