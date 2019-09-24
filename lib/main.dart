import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/weather_page.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weekly Flutter Challenge 2',
      theme: ThemeData(
        fontFamily: "Comfortaa",
      ),
      debugShowCheckedModeBanner: false,
      home: WeatherPage(),
    );
  }
}
