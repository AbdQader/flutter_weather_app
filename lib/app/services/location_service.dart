import 'package:location/location.dart';

class LocationService {

  // prevent making instance
  LocationService._();

  static final LocationService _instance = LocationService._();
  factory LocationService() => _instance;

  bool get isLocationNull => _locationData == null;

  Location location = Location();
  late PermissionStatus _permissionGranted;
  LocationData? _locationData;

  late bool _serviceEnabled;

  Future<bool> hasLocationPermission() async {
    var permissionStatus = await location.hasPermission();
    return permissionStatus == PermissionStatus.granted;
  }

  Future<LocationData?> getUserLocation() async {
    if (_locationData != null) {
      return _locationData!;
    }
    return await _determineLocation();
  }

  Future<LocationData?> _determineLocation() async {
    // check if the service is enabled
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    // check if the permission is granted
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    // get the user lat & long
    _locationData = await location.getLocation();
    return _locationData;
  }

}