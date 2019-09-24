import 'dart:math' as Math;

import 'package:flutter/material.dart';

import '../widgets/weather_details_select.dart';
import '../widgets/weather_daily_box.dart';
import '../widgets/weather_daily_humidity.dart';

class WeatherDetails extends StatefulWidget {
  final Function callbackFunction;

  WeatherDetails(this.callbackFunction);

  @override
  _WeatherDetailsState createState() => _WeatherDetailsState();
}

class _WeatherDetailsState extends State<WeatherDetails> {
  DetailPage selectedPage = DetailPage.thisWeek;
  bool _detailsVisible = false;
  void _setSelectedPage(DetailPage page) {
    setState(() {
      this.selectedPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      width: MediaQuery.of(context).size.width,
      duration: Duration(milliseconds: 1000),
      curve: Curves.easeOut,
      top: _detailsVisible
          ? MediaQuery.of(context).size.height * .22
          : MediaQuery.of(context).size.height - 50,
      child: Container(
        height: MediaQuery.of(context).size.height * .78,
        child: Column(
          children: <Widget>[
            ClipPath(
              clipper: WeatherDetailsClipper(),
              child: InkWell(
                onTap: () {
                  setState(() {
                    _detailsVisible = !_detailsVisible;
                    widget.callbackFunction(_detailsVisible);
                  });
                },
                child: Container(
                  color: Colors.white.withOpacity(0.97),
                  height: 40,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Transform.rotate(
                    angle: _detailsVisible
                        ? Math.pi / 180 * 90
                        : Math.pi / 180 * 270,
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ),
            Expanded(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.97),
                  border: Border.all(width: 0, color: Colors.white),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(_detailsVisible ? 35 : 0),
                    topRight: Radius.circular(_detailsVisible ? 35 : 0),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 40),
                    WeatherDetailsSelect(
                      callbackFunction: _setSelectedPage,
                      selectedPage: selectedPage,
                    ),
                    SizedBox(height: 30),
                    WeatherDailyBox(),
                    SizedBox(height: 10),
                    WeatherDailyHumidity(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WeatherDetailsClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0.0, 40);
    path.lineTo(size.width / 2 - 70 - 8, 40);
    path.quadraticBezierTo(
        size.width / 2 - 45 - 8, 40, size.width / 2 - 30 - 8, 20);
    path.quadraticBezierTo(size.width / 2 - 30 + 75 / 2 - 8, -20,
        size.width / 2 - 30 + 75 - 8, 20);
    path.quadraticBezierTo(
        size.width / 2 - 15 + 75 - 8, 40, size.width / 2 + 20 + 75 - 8, 40);
    path.lineTo(size.width, 40);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(WeatherDetailsClipper oldClipper) => false;
}
