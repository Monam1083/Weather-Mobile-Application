import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_application/models/weather_model.dart';

class WeatherService {
final String apikey = 'YOUR_OPENWEATHER_API_KEY'; // Get free key from openweathermap.org

  Future<Weather> fatchWeather(String cityName) async {
    final url = Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apikey",
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return Weather.fromjson(json.decode(response.body));
    } else {
      throw Exception("failed To load  weather data");
    }
  }
}
