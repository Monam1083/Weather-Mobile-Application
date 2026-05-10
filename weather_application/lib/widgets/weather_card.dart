import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:lottie/lottie.dart';

class WeatherCard extends StatelessWidget {
  final Weather weather;
  const WeatherCard({super.key, required this.weather});
  String formattime(int timestemp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestemp * 1000);
    return DateFormat("hh:mm a").format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color.fromARGB(113, 255, 255, 255),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Lottie.asset(
                weather.description.toLowerCase().contains('rain')
                    ? "assets/rain.json"
                    : weather.description.toLowerCase().contains("clear")
                    ? "assets/sunny.json"
                    : "assets/cloudy.json",
                height: 150,
                width: 150,
              ),
              Text(
                weather.cityName,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 10),

              Text(
                "${weather.temperature.toStringAsFixed(1)}°C",
                style: Theme.of(
                  context,
                ).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                weather.description,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "humidity: ${weather.humidity}%",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  Text(
                    "wind: ${weather.windspeed}m/s",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.wb_sunny_outlined, color: Colors.amber),
                      Text(
                        "Sunrise",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),

                      Text(
                        formattime(weather.sunrise),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      Icon(Icons.nights_stay_outlined, color: Colors.purple),
                      Text(
                        "Sunset",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),

                      Text(
                        formattime(weather.sunset),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
