class Weather {
  var cityName;
  var icon;
  var condition;
  var temp;
  var wind;
  var humidity;
  var wind_dir;
  var gust;

  var pressure;

  var last_update;

  Weather({this.wind,this.humidity,this.temp,this.last_update,this.cityName,
  this.condition,this.gust,this.icon,this.pressure,
  this.wind_dir
  });
  Weather.fromJson(Map<String,dynamic> json){
    cityName =json['location']['name'];
    icon =json['current']['condition']['icon'];
    condition =json['current']['condition']['text'];
    temp =json['current']['temp_c'];
    wind =json['current']['wind_kph'];
    humidity =json['current']['humidity'];
    wind_dir =json['current']['wind_dir'];
    pressure =json['current']['pressure_mb'];
    // precipe =json['current']['precip_mb'];
    last_update =json['current']['last_updated'];
    gust =json['current']['gust_kph'];
    // UV =json['current']['uv'];
    

  }
}