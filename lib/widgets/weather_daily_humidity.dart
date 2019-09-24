import 'package:flutter/material.dart';

class WeatherDailyHumidity extends StatefulWidget {
  _WeatherDailyHumidityState createState() => _WeatherDailyHumidityState();
}

class _WeatherDailyHumidityState extends State<WeatherDailyHumidity> {
  List<Map<String, Object>> humidityByDay = [
    {"day": "M", "humidity": 76},
    {"day": "T", "humidity": 68},
    {"day": "W", "humidity": 52},
    {"day": "T", "humidity": 75},
    {"day": "F", "humidity": 72},
    {"day": "S", "humidity": 33},
    {"day": "S", "humidity": 84},
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ClipPath(
            clipper: HumidityClipper(),
            child: Container(
              height: 100,
              width: double.infinity,
              color: Color(0xFFFFE6BF),
              child: null,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: Color(0xFFFFE6BF),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      ...humidityByDay
                          .map(
                            (dayHumidity) => HumidityNumber(
                                number: dayHumidity['humidity'],
                                title: dayHumidity['day']),
                          )
                          .toList(),
                      // Alternative
                      // for (var dayHumidity in humidityByDay)
                      //   HumidityNumber(
                      //       number: dayHumidity['humidity'],
                      //       title: dayHumidity['day']),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: Divider(
                              thickness: 1,
                              color: Color(0xFFF5D5AB),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "Avg humidity 66%",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Divider(
                              thickness: 1,
                              color: Color(0xFFF5D5AB),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HumidityNumber extends StatelessWidget {
  final int number;
  final String title;
  HumidityNumber({this.number, this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        children: <Widget>[
          Container(child: Text("$number%", style: TextStyle(fontSize: 18))),
          SizedBox(height: 10),
          Container(
            child: Text(
              "$title",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class HumidityClipper extends CustomClipper<Path> {
  List<int> _points = [76, 68, 52, 75, 72, 33, 84];

  @override
  Path getClip(Size size) {
    var position = 0;
    var path = Path()
      ..moveTo(0.0, size.height / 2)
      ..quadraticBezierTo(
        size.width / 8 * position + size.width / 16,
        size.height / 2 + (_points[0] - 50),
        size.width / 8 * ++position,
        size.height * (1 - _points[0] / 100),
      )
      ..quadraticBezierTo(
        size.width / 8 * position + size.width / 16,
        size.height * (1 - _points[0] / 100) +
            (size.height * (1 - _points[1] / 100 - _points[0] / 100)) / 2 +
            -10,
        size.width / 8 * ++position,
        size.height * (1 - _points[1] / 100) - 10,
      )
      ..quadraticBezierTo(
        size.width / 8 * position + size.width / 16,
        size.height * (1 - _points[1] / 100) + 10,
        size.width / 8 * ++position,
        size.height * (1 - _points[2] / 100),
      )
      ..quadraticBezierTo(
        size.width / 8 * position + size.width / 16,
        size.height * (1 - _points[2] / 100) + 10,
        size.width / 8 * ++position,
        size.height * (1 - _points[3] / 100),
      )
      ..quadraticBezierTo(
        size.width / 8 * position + size.width / 16,
        size.height * (1 - _points[3] / 100) - 30,
        size.width / 8 * ++position,
        size.height * (1 - _points[4] / 100),
      )
      ..quadraticBezierTo(
        size.width / 8 * position + size.width / 16,
        size.height * (1 - _points[4] / 100) + 60,
        size.width / 8 * ++position,
        size.height * (1 - _points[5] / 100),
      )
      ..quadraticBezierTo(
        size.width / 8 * position + size.width / 16,
        size.height * (1 - _points[5] / 100) - 50,
        size.width / 8 * ++position,
        size.height * (1 - _points[6] / 100) - 12,
      )
      ..quadraticBezierTo(
        size.width / 8 * position + size.width / 16,
        size.height * (1 - _points[6] / 100) - 22,
        size.width / 8 * ++position,
        size.height * 0.5,
      );

    path.lineTo(
      size.width,
      size.height,
    );
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
