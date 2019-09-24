import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/weather_summary.dart';
import '../widgets/snowflake.dart';
import '../widgets/weather_details.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  bool _showDetails = false;
  bool _prepareShowDetails = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    void _setShowDetails(bool show) {
      new Future.delayed(Duration(milliseconds: show ? 650 : 0), () {
        setState(() {
          this._showDetails = show;
        });
      });
      new Future.delayed(Duration(milliseconds: show ? 200 : 450), () {
        setState(() {
          this._prepareShowDetails = show;
        });
      });
    }

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ...generateSnowflakes(100),
          WeatherSummary(_showDetails, _prepareShowDetails),
          WeatherDetails(_setShowDetails),
        ],
      ),
    );
  }
}
