import 'package:flutter/material.dart';

class HomeScroll extends StatefulWidget {
  @override
  _HomeScrollState createState() => _HomeScrollState();
}

class _HomeScrollState extends State<HomeScroll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0Xff9f9f9),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 28.0, horizontal: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Discover Places",
                  style: TextStyle(
                    color: Color(0xff142243),
                    fontSize: 32.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Choose your next Destination and have good vacation",
                  style: TextStyle(
                    color: Color(0xff142243),
                    letterSpacing: 3.0,
                    height: 1.5,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
