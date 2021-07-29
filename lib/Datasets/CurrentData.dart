class Currentdata
{

  int feels_like=0;
  int temperature=0;
  String desc='Unable to get Data';
  String city='Mugma';
  double wind_speed=0;
  int humidity=0;

  void getCurrentData(dynamic weatherData)
  {
    if(weatherData!=null)
    {
      double temp= weatherData['current']['feels_like'];
      feels_like =temp.toInt();
      temp=weatherData['current']['temp'];
      temperature=temp.toInt();
      desc=weatherData['current']['weather'][0]['description'];
      wind_speed=weatherData['current']['wind_speed'];
      humidity=weatherData['current']['humidity'];
    }
  }

}