import 'current_model.dart';
import 'location_model.dart';

class WeatherModel {
  Location location;
  Current current;

  WeatherModel({
    required this.location,
    required this.current,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
    location: Location.fromJson(json['location']),
    current: Current.fromJson(json['current']),
  );

  Map<String, dynamic> toJson() => {
    'location': location.toJson(),
    'current': current.toJson(),
  };
}