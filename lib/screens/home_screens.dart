import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/screens/constans.dart/constans.dart';
import 'package:weather_app/screens/data/model/data_model.dart';

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
                  padding: const EdgeInsets.only(top: 60),
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        width: 356,
                        height: 350,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            _getWeatherContainer(),
            Padding(
              padding: EdgeInsets.only(top: 740, left: 110, right: 100),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  minimumSize: Size(300, 60),
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  sendRequestCurrentWeather();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Forecast report',
                      style: TextStyle(
                          color: Colors.black, fontSize: 16, fontFamily: 'IR'),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.keyboard_arrow_up,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getWeatherContainer() {
    return Padding(
      padding: EdgeInsets.only(top: 365, left: 70, right: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 50),
            child: Row(
              children: [
                Text('Today,', style: Theme.of(context).textTheme.bodySmall),
                Text('12 september',
                    style: Theme.of(context).textTheme.bodySmall)
              ],
            ),
          ),
          SizedBox(height: 10),
          Text('29°', style: Theme.of(context).textTheme.bodyLarge),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 90),
            child:
                Text('Cloudy', style: Theme.of(context).textTheme.bodyMedium),
          ),
          SizedBox(
            height: 36,
          ),
          Row(
            children: [
              Image.asset('assets/images/windy.png'),
              SizedBox(
                width: 40,
              ),
              Text(
                'Wind',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                width: 35,
              ),
              Text('|', style: Theme.of(context).textTheme.bodySmall),
              SizedBox(
                width: 40,
              ),
              Text('10Km/h', style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Image.asset('assets/images/hum.png'),
              SizedBox(
                width: 40,
              ),
              Text(
                'Hum',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                width: 40,
              ),
              Text('|', style: Theme.of(context).textTheme.bodySmall),
              SizedBox(
                width: 40,
              ),
              Text('54 %', style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ],
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
          Image.asset('assets/images/map.png'),
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
          Image.asset('assets/images/notif.png'),
        ],
      ),
    );
  }

  void sendRequestCurrentWeather() async {
    var apiKey = 'e98ccfe766b267bf53655b5c0360a9ba';
    var cityName = 'tabriz';
    var response = await Dio().get(
        'https://api.openweathermap.org/data/2.5/weather',
        queryParameters: {'q': cityName, 'appid': apiKey, 'units': 'metric'});
    var jsonMapObject = response.data; // به ما یدونه مپ میده
    var dataModel = DataModel.fromJson(jsonMapObject);
    print(dataModel.dt);
  }
}
