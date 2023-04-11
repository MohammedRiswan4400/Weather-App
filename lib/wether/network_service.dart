import 'dart:convert';
import 'package:api_calling/wether/weather_model.dart';
import 'package:http/http.dart' as http;
// import 'pa';

class NetworkService {
  static Future<WetharModel> getWeatherData({required String url}) async {
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final data = WetharModel.fromJson(body);
      return data;
    } else {
      return WetharModel(
          cityName: "",
          temp: 0,
          humidity: 0,
          wind: 0,
          pressure: 0,
          speed: 0,
          discription: "");
    }
  }
}
