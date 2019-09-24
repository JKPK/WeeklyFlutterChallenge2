import 'package:flutter/material.dart';

class WeatherDailyBox extends StatelessWidget {
  const WeatherDailyBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          WeatherDailyLine(
              title: "Tomorrow",
              image: AssetImage("assets/icons/rainy.png"),
              description: "Rainy",
              temperature: -3),
          WeatherDailyLine(
              title: "Tuesday",
              image: AssetImage("assets/icons/cloudy_with_sun.png"),
              description: "Cloudy",
              temperature: -6),
          WeatherDailyLine(
              title: "Wednesday",
              image: AssetImage("assets/icons/snowy.png"),
              description: "Snowy",
              temperature: -8),
          WeatherDailyLine(
              title: "Thursday",
              image: AssetImage("assets/icons/foggy.png"),
              description: "Foggy",
              temperature: -2),
          WeatherDailyLine(
              title: "Friday",
              image: AssetImage("assets/icons/sunny.png"),
              description: "Sunny",
              temperature: 0),
          WeatherDailyLine(
              title: "Saturday",
              image: AssetImage("assets/icons/stormy.png"),
              description: "Stormy",
              temperature: 2),
          WeatherDailyLine(
              title: "Sunday",
              image: AssetImage("assets/icons/cloudy.png"),
              description: "cloudy",
              temperature: -1),
        ],
      ),
    );
  }
}

class WeatherDailyLine extends StatelessWidget {
  final String title;
  final AssetImage image;
  final String description;
  final int temperature;

  WeatherDailyLine(
      {this.title, this.image, this.description, this.temperature});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              child: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 1),
              child: Image(
                fit: BoxFit.contain,
                image: image,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(description),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Text("$temperature°",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
