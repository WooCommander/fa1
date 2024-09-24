import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherWidget extends StatefulWidget {
  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  String? _temperature;
  String? _description;

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  Future<void> _fetchWeather() async {
    final response = await http.get(
      Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=London&appid=YOUR_API_KEY&units=metric'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _temperature = data['main']['temp'].toString();
        _description = data['weather'][0]['description'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _temperature == null
        ? CircularProgressIndicator()
        : Column(
            children: [
              Text(
                'Temperature: $_temperature°C',
                style: TextStyle(fontSize: 24),
              ),
              Text(
                'Description: $_description',
                style: TextStyle(fontSize: 18),
              ),
            ],
          );
  }
}
