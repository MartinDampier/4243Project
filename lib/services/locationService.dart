import 'package:location/location.dart';

class LocationService {
  bool IsEnabled = false;
  bool IsCurrentLocation = false;
  Location location = new Location();
  LocationData? CurrentLocation;

  Future<void> Setup() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if(! _serviceEnabled){
      _serviceEnabled = await location.requestService();
      if(!_serviceEnabled)
        {
          return;
        }
    }
    IsEnabled = true;
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    CurrentLocation = await location.getLocation();
  }
  Future<LocationData> GetLocation() async {
    return CurrentLocation = await location.getLocation();
  }
}
