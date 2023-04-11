import 'package:api_calling/wether/api_key.dart';
import 'package:api_calling/wether/network_service.dart';

class WetharModel {
  final String cityName;
  final double temp;
  final int humidity;
  final int wind;
  final int pressure;
  final double speed;
  final String discription;
  WetharModel({
    required this.cityName,
    required this.temp,
    required this.humidity,
    required this.wind,
    required this.pressure,
    required this.speed,
    required this.discription,
  });

  static WetharModel fromJson(Map json) {
    return WetharModel(
        cityName: json["name"],
        temp: json["main"]["temp"],
        humidity: json["main"]["humidity"],
        wind: json["wind"]["deg"],
        pressure: json["main"]["pressure"],
        speed: json["wind"]["speed"],
        discription: json["weather"][0]["description"]);
  }

  static Future<WetharModel> getcurrentwether(
      {required double lat, required double lon}) async {
    String url =
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric";

    final weather = await NetworkService.getWeatherData(url: url);
    return weather;
  }

  static Future<WetharModel> getCitywether({required String cityName}) async {
    String url =
        // "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric";
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric";

    final weather = await NetworkService.getWeatherData(url: url);
    return weather;
  }
}
