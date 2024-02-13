import 'package:flutter/material.dart';
import 'package:weather_app/screens/home_screens.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodySmall: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.white,
            fontFamily: 'IR',
            fontSize: 20,
            shadows: [
              Shadow(
                color: Colors.black12,
                offset: Offset(-3, 2),
                blurRadius: 3,
              ),
            ],
          ),
          bodyLarge: TextStyle(
            fontWeight: FontWeight.w300,
            color: Colors.white,
            fontFamily: 'IR',
            fontSize: 100,
            shadows: [
              Shadow(
                color: Colors.black12,
                offset: Offset(-10, 5),
                blurRadius: 20,
              ),
            ],
          ),
          bodyMedium: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontFamily: 'IM',
            fontSize: 26,
            shadows: [
              Shadow(
                color: Colors.black12,
                offset: Offset(-3, 2),
                blurRadius: 3,
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: HommePage(),
    );
  }
}
