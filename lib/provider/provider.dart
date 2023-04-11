import 'package:api_calling/wether/weather_model.dart';
import 'package:flutter/cupertino.dart';

class changeState extends ChangeNotifier {
  WetharModel? _data;

  WetharModel get display => _data!;

  void initState(WetharModel data) {
    _data = data;
    notifyListeners();
  }

  void searchWeather(WetharModel data) {
    _data = data;
    notifyListeners();
  }
}
