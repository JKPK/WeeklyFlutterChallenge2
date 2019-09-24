import 'package:flutter/material.dart';

class WeatherSummary extends StatefulWidget {
  final bool showDetails;
  final bool prepareShowDetails;

  WeatherSummary(this.showDetails, this.prepareShowDetails);

  _WeatherSummaryState createState() => _WeatherSummaryState();
}

class _WeatherSummaryState extends State<WeatherSummary> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AnimatedOpacity(
          duration: Duration(milliseconds: 350),
          opacity: widget.prepareShowDetails ? 0.0 : 1.0,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 350),
            padding: EdgeInsets.only(top: widget.showDetails ? 35 : 70),
            width: double.infinity,
            child: widget.showDetails
                ? null
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.location_on, color: Colors.white, size: 21),
                      Text("Szczecin",
                          style: TextStyle(color: Colors.white, fontSize: 16))
                    ],
                  ),
          ),
        ),
        SizedBox(height: 15),
        AnimatedContainer(
          duration: Duration(milliseconds: 350),
          decoration: BoxDecoration(
            color: widget.prepareShowDetails
                ? Colors.white.withOpacity(0.0)
                : Colors.white,
            borderRadius: BorderRadius.all(const Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                  color: widget.prepareShowDetails
                      ? Colors.black.withOpacity(0.0)
                      : Colors.black.withOpacity(0.5),
                  blurRadius: 25.0,
                  spreadRadius: -10.0,
                  offset: Offset(0, 5.0))
            ],
          ),
          width: widget.showDetails
              ? MediaQuery.of(context).size.width
              : MediaQuery.of(context).size.width * .75,
          child: AnimatedDefaultTextStyle(
            style: TextStyle(
              color: widget.prepareShowDetails ? Colors.white : Colors.black,
              fontFamily: "Comfortaa",
            ),
            duration: Duration(milliseconds: 350),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 350),
                    padding: EdgeInsets.only(
                        top: 7, right: widget.showDetails ? 45 : 20),
                    alignment: Alignment.centerRight,
                    child: Text("-5°C", style: TextStyle(fontSize: 50)),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 350),
                    padding: EdgeInsets.only(
                        left: widget.showDetails ? 50 : 20,
                        top: 10,
                        bottom: 10),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        WeatherDetail(
                            image: AssetImage("assets/icons/humidity.png"),
                            title: '73%',
                            showDetails: widget.prepareShowDetails),
                        WeatherDetail(
                            image: AssetImage("assets/icons/wind.png"),
                            title: '12m/s',
                            showDetails: widget.prepareShowDetails),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class WeatherDetail extends StatefulWidget {
  final String title;
  final AssetImage image;
  final bool showDetails;

  WeatherDetail({this.image, this.title, this.showDetails});

  @override
  _WeatherDetailState createState() => _WeatherDetailState();
}

class _WeatherDetailState extends State<WeatherDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: <Widget>[
          AnimatedContainer(
            duration: Duration(milliseconds: 350),
            decoration: BoxDecoration(
              color: widget.showDetails ? Color(0xFFFFFFFF) : Color(0xFFFFE6BF),
              borderRadius: BorderRadius.all(
                const Radius.circular(10),
              ),
            ),
            width: 35,
            height: 35,
            child: FractionallySizedBox(
              heightFactor: 0.6,
              widthFactor: 0.6,
              child: Image(
                image: widget.image,
              ),
            ),
          ),
          SizedBox(width: 10),
          Text(widget.title, style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
