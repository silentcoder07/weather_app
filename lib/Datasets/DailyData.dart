
class Dailydata
{
  int min=0;
  int max=0;
  String icon='';
  String description='';
  int dt=0;

  void getDailydata(dynamic weatherdata,int i)
  {
    dt=weatherdata['daily'][i]['dt'];
    min=weatherdata['daily'][i]['temp']['min'].toInt();
    max= weatherdata['daily'][i]['temp']['max'].toInt();
    description = weatherdata['daily'][i]['weather'][0]['description'];
    icon =weatherdata['daily'][i]['weather'][0]['icon'];
  }
}