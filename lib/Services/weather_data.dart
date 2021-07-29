import 'location.dart';
import 'networking.dart';

const apiKey ='3b2f5d76c0a7431cc2784bceb4ac67e9';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/onecall';


class WeatherData {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkData networkHelper = NetworkData(url:
    '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkData networkdata = NetworkData(url:
    '$openWeatherMapURL?lat=${location.latitude}&lon=${location
        .longitude}&exclude=minutely,alerts&appid=$apiKey&units=metric');

    var weatherData = await networkdata.getData();
    return weatherData;
  }
}