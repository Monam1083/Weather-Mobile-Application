import 'package:flutter/material.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/services/weather_service.dart';
import 'package:weather_application/widgets/weather_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherService _weatherService = WeatherService();
  bool isloading = false;
  Weather? _weather;
  final TextEditingController _controller = TextEditingController();

  void getWeather() async {
    setState(() {
      isloading = true;
    });

    try {
      final weather = await _weatherService.fatchWeather(_controller.text);
      setState(() {
        _weather = weather;
        isloading = false;
      });
    } catch (e) {
      setState(() => isloading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error fetching weather data")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient:
              _weather != null &&
                  _weather!.description.toLowerCase().contains("rain")
              ? LinearGradient(
                  colors: [Colors.grey, Colors.blueGrey],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              : _weather != null &&
                    _weather!.description.toLowerCase().contains("clear")
              ? LinearGradient(colors: [Colors.orangeAccent, Colors.blueAccent])
              : LinearGradient(
                  colors: [Colors.orangeAccent, Colors.lightBlueAccent],
                ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 25),
                Text(
                  "Weather App",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 25),
                TextField(
                  controller: _controller,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Enter your city Name",
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: const Color.fromARGB(110, 255, 255, 255),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: getWeather,
                  child: Text("Get Weather", style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(209, 125, 155, 170),
                    foregroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                if (isloading)
                  Padding(
                    padding: EdgeInsetsGeometry.all(20),
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                if (_weather != null) WeatherCard(weather: _weather!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
