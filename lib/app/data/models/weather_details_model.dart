import 'condition_model.dart';
import 'current_model.dart';
import 'location_model.dart';

class WeatherDetailsModel {
  Location location;
  Current current;
  Forecast forecast;

  WeatherDetailsModel({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory WeatherDetailsModel.fromJson(Map<String, dynamic> json) => WeatherDetailsModel(
    location: Location.fromJson(json['location']),
    current: Current.fromJson(json['current']),
    forecast: Forecast.fromJson(json['forecast']),
  );

  Map<String, dynamic> toJson() => {
    'location': location.toJson(),
    'current': current.toJson(),
    'forecast': forecast.toJson(),
  };
}

class Forecast {
    List<Forecastday> forecastday;

    Forecast({required this.forecastday});

    factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
      forecastday: List<Forecastday>.from(json['forecastday'].map((x) => Forecastday.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
      'forecastday': List<dynamic>.from(forecastday.map((x) => x.toJson())),
    };
}

class Forecastday {
  DateTime date;
  num dateEpoch;
  Day day;
  Astro astro;
  List<Hour> hour;

  Forecastday({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hour,
  });

  factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
    date: DateTime.parse(json['date']),
    dateEpoch: json['date_epoch'],
    day: Day.fromJson(json['day']),
    astro: Astro.fromJson(json['astro']),
    hour: List<Hour>.from(json['hour'].map((x) => Hour.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'date': '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}',
    'date_epoch': dateEpoch,
    'day': day.toJson(),
    'astro': astro.toJson(),
    'hour': List<dynamic>.from(hour.map((x) => x.toJson())),
  };
}

class Astro {
  String sunrise;
  String sunset;
  String moonrise;
  String moonset;
  String moonPhase;
  String moonIllumination;
  num isMoonUp;
  num isSunUp;

  Astro({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.moonIllumination,
    required this.isMoonUp,
    required this.isSunUp,
  });

  factory Astro.fromJson(Map<String, dynamic> json) => Astro(
    sunrise: json['sunrise'],
    sunset: json['sunset'],
    moonrise: json['moonrise'],
    moonset: json['moonset'],
    moonPhase: json['moon_phase'],
    moonIllumination: json['moon_illumination'],
    isMoonUp: json['is_moon_up'],
    isSunUp: json['is_sun_up'],
  );

  Map<String, dynamic> toJson() => {
    'sunrise': sunrise,
    'sunset': sunset,
    'moonrise': moonrise,
    'moonset': moonset,
    'moon_phase': moonPhase,
    'moon_illumination': moonIllumination,
    'is_moon_up': isMoonUp,
    'is_sun_up': isSunUp,
  };
}

class Day {
  double maxtempC;
  double maxtempF;
  double mintempC;
  double mintempF;
  double avgtempC;
  double avgtempF;
  double maxwindMph;
  double maxwindKph;
  num totalprecipMm;
  num totalprecipIn;
  num totalsnowCm;
  num avgvisKm;
  num avgvisMiles;
  num avghumidity;
  num dailyWillItRain;
  num dailyChanceOfRain;
  num dailyWillItSnow;
  num dailyChanceOfSnow;
  Condition condition;
  num uv;

  Day({
    required this.maxtempC,
    required this.maxtempF,
    required this.mintempC,
    required this.mintempF,
    required this.avgtempC,
    required this.avgtempF,
    required this.maxwindMph,
    required this.maxwindKph,
    required this.totalprecipMm,
    required this.totalprecipIn,
    required this.totalsnowCm,
    required this.avgvisKm,
    required this.avgvisMiles,
    required this.avghumidity,
    required this.dailyWillItRain,
    required this.dailyChanceOfRain,
    required this.dailyWillItSnow,
    required this.dailyChanceOfSnow,
    required this.condition,
    required this.uv,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
    maxtempC: json['maxtemp_c']?.toDouble(),
    maxtempF: json['maxtemp_f']?.toDouble(),
    mintempC: json['mintemp_c']?.toDouble(),
    mintempF: json['mintemp_f']?.toDouble(),
    avgtempC: json['avgtemp_c']?.toDouble(),
    avgtempF: json['avgtemp_f']?.toDouble(),
    maxwindMph: json['maxwind_mph']?.toDouble(),
    maxwindKph: json['maxwind_kph']?.toDouble(),
    totalprecipMm: json['totalprecip_mm'],
    totalprecipIn: json['totalprecip_in'],
    totalsnowCm: json['totalsnow_cm'],
    avgvisKm: json['avgvis_km'],
    avgvisMiles: json['avgvis_miles'],
    avghumidity: json['avghumidity'],
    dailyWillItRain: json['daily_will_it_rain'],
    dailyChanceOfRain: json['daily_chance_of_rain'],
    dailyWillItSnow: json['daily_will_it_snow'],
    dailyChanceOfSnow: json['daily_chance_of_snow'],
    condition: Condition.fromJson(json['condition']),
    uv: json['uv'],
  );

  Map<String, dynamic> toJson() => {
    'maxtemp_c': maxtempC,
    'maxtemp_f': maxtempF,
    'mintemp_c': mintempC,
    'mintemp_f': mintempF,
    'avgtemp_c': avgtempC,
    'avgtemp_f': avgtempF,
    'maxwind_mph': maxwindMph,
    'maxwind_kph': maxwindKph,
    'totalprecip_mm': totalprecipMm,
    'totalprecip_in': totalprecipIn,
    'totalsnow_cm': totalsnowCm,
    'avgvis_km': avgvisKm,
    'avgvis_miles': avgvisMiles,
    'avghumidity': avghumidity,
    'daily_will_it_rain': dailyWillItRain,
    'daily_chance_of_rain': dailyChanceOfRain,
    'daily_will_it_snow': dailyWillItSnow,
    'daily_chance_of_snow': dailyChanceOfSnow,
    'condition': condition.toJson(),
    'uv': uv,
  };
}

class Hour {
  num timeEpoch;
  String time;
  double tempC;
  double tempF;
  num isDay;
  Condition condition;
  double windMph;
  double windKph;
  num windDegree;
  String windDir;
  num pressureMb;
  double pressureIn;
  num precipMm;
  num precipIn;
  num humidity;
  num cloud;
  double feelslikeC;
  double feelslikeF;
  double windchillC;
  double windchillF;
  double heatindexC;
  double heatindexF;
  double dewpointC;
  double dewpointF;
  num willItRain;
  num chanceOfRain;
  num willItSnow;
  num chanceOfSnow;
  num visKm;
  num visMiles;
  double gustMph;
  double gustKph;
  num uv;

  Hour({
    required this.timeEpoch,
    required this.time,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.willItRain,
    required this.chanceOfRain,
    required this.willItSnow,
    required this.chanceOfSnow,
    required this.visKm,
    required this.visMiles,
    required this.gustMph,
    required this.gustKph,
    required this.uv,
  });

  factory Hour.fromJson(Map<String, dynamic> json) => Hour(
    timeEpoch: json['time_epoch'],
    time: json['time'],
    tempC: json['temp_c']?.toDouble(),
    tempF: json['temp_f']?.toDouble(),
    isDay: json['is_day'],
    condition: Condition.fromJson(json['condition']),
    windMph: json['wind_mph']?.toDouble(),
    windKph: json['wind_kph']?.toDouble(),
    windDegree: json['wind_degree'],
    windDir: json['wind_dir'],
    pressureMb: json['pressure_mb'],
    pressureIn: json['pressure_in']?.toDouble(),
    precipMm: json['precip_mm'],
    precipIn: json['precip_in'],
    humidity: json['humidity'],
    cloud: json['cloud'],
    feelslikeC: json['feelslike_c']?.toDouble(),
    feelslikeF: json['feelslike_f']?.toDouble(),
    windchillC: json['windchill_c']?.toDouble(),
    windchillF: json['windchill_f']?.toDouble(),
    heatindexC: json['heatindex_c']?.toDouble(),
    heatindexF: json['heatindex_f']?.toDouble(),
    dewpointC: json['dewpoint_c']?.toDouble(),
    dewpointF: json['dewpoint_f']?.toDouble(),
    willItRain: json['will_it_rain'],
    chanceOfRain: json['chance_of_rain'],
    willItSnow: json['will_it_snow'],
    chanceOfSnow: json['chance_of_snow'],
    visKm: json['vis_km'],
    visMiles: json['vis_miles'],
    gustMph: json['gust_mph']?.toDouble(),
    gustKph: json['gust_kph']?.toDouble(),
    uv: json['uv'],
  );

  Map<String, dynamic> toJson() => {
    'time_epoch': timeEpoch,
    'time': time,
    'temp_c': tempC,
    'temp_f': tempF,
    'is_day': isDay,
    'condition': condition.toJson(),
    'wind_mph': windMph,
    'wind_kph': windKph,
    'wind_degree': windDegree,
    'wind_dir': windDir,
    'pressure_mb': pressureMb,
    'pressure_in': pressureIn,
    'precip_mm': precipMm,
    'precip_in': precipIn,
    'humidity': humidity,
    'cloud': cloud,
    'feelslike_c': feelslikeC,
    'feelslike_f': feelslikeF,
    'windchill_c': windchillC,
    'windchill_f': windchillF,
    'heatindex_c': heatindexC,
    'heatindex_f': heatindexF,
    'dewpoint_c': dewpointC,
    'dewpoint_f': dewpointF,
    'will_it_rain': willItRain,
    'chance_of_rain': chanceOfRain,
    'will_it_snow': willItSnow,
    'chance_of_snow': chanceOfSnow,
    'vis_km': visKm,
    'vis_miles': visMiles,
    'gust_mph': gustMph,
    'gust_kph': gustKph,
    'uv': uv,
  };
}