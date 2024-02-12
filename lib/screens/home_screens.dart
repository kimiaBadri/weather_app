import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/screens/constans.dart/constans.dart';

class HommePage extends StatefulWidget {
  const HommePage({super.key});

  @override
  State<HommePage> createState() => _HommePageState();
}

class _HommePageState extends State<HommePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  AppColor.backgroundColor1,
                  AppColor.backgroundColor2,
                ], begin: Alignment.bottomLeft, end: Alignment.topRight),
              ),
            ),
            Positioned(
              top: 90,
              child: Image.asset('assets/images/Vector 12.png'),
            ),
            Positioned(
              left: 140,
              child: Image.asset('assets/images/Vector 11.png'),
            ),
            Column(
              children: [
                _getBarItems(),
                _getWeatherIcon(),
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        width: 350,
                        height: 350,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(255, 255, 255, 0.2),
                                Color.fromRGBO(255, 255, 255, 0.2),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _getWeatherIcon() {
    return Padding(
      padding: const EdgeInsets.only(top: 60, right: 80, left: 40),
      child: Image.asset(
        'assets/images/weather_icons/116@2x.png',
        width: 150,
        height: 150,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _getBarItems() {
    return Padding(
      padding: const EdgeInsets.only(top: 44, left: 30, right: 30),
      child: Row(
        children: [
          Icon(
            Icons.location_on_outlined,
            color: Colors.white,
            size: 26,
          ),
          SizedBox(
            width: 16,
          ),
          Text(
            'Semarange',
            style: TextStyle(
              fontFamily: 'IR',
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.w700,
              shadows: [
                Shadow(
                  color: Color.fromARGB(255, 142, 142, 142),
                  offset: Offset(0, 2),
                  blurRadius: 20,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Icon(
            Icons.arrow_drop_down_outlined,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            width: 100,
          ),
          Icon(
            Icons.notifications_active_outlined,
            color: Colors.white,
            size: 26,
          ),
        ],
      ),
    );
  }
}
