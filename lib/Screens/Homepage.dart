import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/Datasets/CurrentData.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,required this.locationweather}) : super(key: key);

  final locationweather;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Currentdata curr_weather =Currentdata();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    curr_weather.getCurrentData(widget.locationweather);
  }

  void updateui(dynamic weatherData)
  {
    setState(() {
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CurrentWeather(curr_weather: curr_weather,),
        ],

      ),
    );
  }
}



class CurrentWeather extends StatelessWidget {
  const CurrentWeather({Key? key,required this.curr_weather}) : super(key: key);
  final Currentdata curr_weather;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 350,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
          decoration: BoxDecoration(
              color: Color(0xff212F5E),
              borderRadius: BorderRadius.circular(50)
          ),

        ),

        Container(
          height: 325,
          width: double.infinity,
          margin: EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 30),
          decoration: BoxDecoration(
                      color: Color(0xff354A97),
                       borderRadius: BorderRadius.circular(50)
            ),),

        Container(
          child: CurrentData(curr_weather: curr_weather,),
          height: 300,
          width: double.infinity,
          margin: EdgeInsets.only(left: 5,right: 5,top: 5,bottom: 50),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff65ACF2),
                Color(0xff5375EB)
              ],
            ),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50),bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50)),
          ),
        ),

      ],
    );
  }
}



class ExtraData extends StatelessWidget {
  const ExtraData({Key? key,required this.dataname,required this.customIcon,required this.data}) : super(key: key);
  final String dataname;
  final IconData customIcon;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(dataname),
        SizedBox(
          height: 5,
        ),
        Icon(customIcon),
        SizedBox(
          height: 10,
        ),
        Text(data)
      ],
    );
  }
}



class ExtraDataBox extends StatelessWidget {
  const ExtraDataBox({Key? key,required this.humidity,required this.temp,required this.speed}) : super(key: key);
  final double speed;
  final int humidity;
  final int temp;

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(left: 20,right: 25),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color:Color(0xff2A3F76),
          borderRadius: BorderRadiusDirectional.circular(25)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          ExtraData(dataname: 'Wind', customIcon: FontAwesomeIcons.wind, data: '$speed kmh'),
          ExtraData(dataname: 'Humidity', customIcon: FontAwesomeIcons.water, data: '$humidity %'),
          ExtraData(dataname: 'Temp', customIcon: FontAwesomeIcons.temperatureLow, data: '$temp°'),

        ],
      ),
    );
  }
}


class CurrentData extends StatelessWidget {
  const CurrentData({Key? key,required this.curr_weather}) : super(key: key);
  final Currentdata curr_weather;

  @override
  Widget build(BuildContext context) {


    return Column(

      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on),
              Text('${curr_weather.city}')
            ],
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(FontAwesomeIcons.cloud,size: 100,),
            Column(
              children: [
                Text('${curr_weather.feels_like}°',style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold
                ),),
                Text('${curr_weather.desc}',style: TextStyle(
                  fontSize: 20
                ),)
              ],
            ),

          ],
        ),

        ExtraDataBox(speed: curr_weather.wind_speed,humidity: curr_weather.humidity,temp: curr_weather.temperature,),
      ],
    );
  }
}
