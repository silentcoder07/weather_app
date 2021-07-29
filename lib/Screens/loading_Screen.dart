import 'package:flutter/material.dart';
import 'package:weather_app/Datasets/CurrentData.dart';
import 'package:weather_app/Screens/Homepage.dart';
import 'package:weather_app/Services/weather_data.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
@override
State<StatefulWidget> createState() {
  return _LoadingScreenState();
}
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherData().getLocationWeather();
    var curr_data= Currentdata().getCurrentData(weatherData);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MyHomePage(
        locationweather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}