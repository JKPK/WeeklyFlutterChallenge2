import 'package:flutter/material.dart';

class WeatherDetailsSelect extends StatefulWidget {
  final Function callbackFunction;
  final DetailPage selectedPage;
  WeatherDetailsSelect({this.callbackFunction, this.selectedPage});
  _WeatherDetailsSelectState createState() => _WeatherDetailsSelectState();
}

class _WeatherDetailsSelectState extends State<WeatherDetailsSelect> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50),
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Color(0xFFFFE6BF),
        borderRadius: BorderRadius.all(const Radius.circular(20)),
      ),
      child: Stack(
        children: <Widget>[
          AnimatedContainer(
            curve: Curves.decelerate,
            duration: Duration(milliseconds: 300),
            alignment: widget.selectedPage == DetailPage.thisWeek
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: FractionallySizedBox(
              widthFactor: .5,
              child: Container(
                alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () => widget.callbackFunction(DetailPage.today),
                  child: Center(
                    child: Container(
                      child: Text("Today",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () => widget.callbackFunction(DetailPage.thisWeek),
                  child: Center(
                    child: Container(
                      child: Text("This week",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

enum DetailPage {
  today,
  thisWeek,
}
