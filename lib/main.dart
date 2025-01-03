import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Dark Overlay
          Container(
            color: Colors.black.withOpacity(0.5), // Lapisan gelap semi-transparan
          ),

          // Content
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [],
                    children: [
                      Text(
                        'Weatherman',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Harlem\nTuesday, January 10, 2019',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                // Temperature
                Column(
                  children: [
                    Text(
                      '15°C',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Cloudy',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      '25°C / 28°C',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),

                // Bottom Navigation
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    WeatherDayWidget(icon: Icons.wb_sunny, label: 'Today', temp: '25°C'),
                    WeatherDayWidget(icon: Icons.cloud, label: 'Friday', temp: '26°C'),
                    WeatherDayWidget(icon: Icons.ac_unit, label: 'Saturday', temp: '27°C'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WeatherDayWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final String temp;

  const WeatherDayWidget({
    required this.icon,
    required this.label,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white70, size: 32),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),
        SizedBox(height: 4),
        Text(
          temp,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ],
    );
  }
}
