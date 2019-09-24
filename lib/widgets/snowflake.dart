import 'dart:math';
import 'package:flutter/material.dart';

class Snowflake extends StatefulWidget {
  const Snowflake({Key key}) : super(key: key);
  _SnowflakeState createState() => _SnowflakeState();
}

class _SnowflakeState extends State<Snowflake>
    with SingleTickerProviderStateMixin {
  double top;
  double left;
  double radius;
  double speed;

  Animation<double> _animation;
  Tween<double> _tween;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    left = Random().nextDouble();
    top = Random().nextDouble();
    radius = 1 + Random().nextDouble() * 2;

    _controller = AnimationController(
        duration: Duration(
            milliseconds: (20000 * (1 - top) + Random().nextInt(3000)).round()),
        vsync: this);

    _tween = Tween<double>(begin: top, end: 1);

    _animation = _tween.animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          left = Random().nextDouble();
          _tween.begin = 0;
          _controller.duration =
              Duration(milliseconds: 20000 + Random().nextInt(3000));
          _controller.reset();
          _controller.forward();
        }
      });

    _controller.forward();
  }

  double getVisibility() {
    if (_animation.value <= .7) {
      return 1.0;
    }
    if (_animation.value >= .95) {
      return 0;
    }
    return ((.95 - _animation.value) / .25);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _animation.value * MediaQuery.of(context).size.height,
      left: left * MediaQuery.of(context).size.width,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(getVisibility()),
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
        width: radius * 2,
        height: radius * 2,
      ),
    );
  }
}

List<Widget> generateSnowflakes(int quantity) {
  quantity = quantity < 1 ? 1 : quantity;
  List<Widget> snowflakes = new List();
  for (var i = 0; i < quantity; i++) {
    snowflakes.add(Snowflake());
  }
  return snowflakes;
}
