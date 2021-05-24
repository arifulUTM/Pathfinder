import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pathfinder/nearby/services/geolocator_service.dart';

class Applicationbloc with ChangeNotifier {
  final geolocatorService = GeolocatorService();

  //Variables

  Position currentLocation;

  Applicationbloc() {
    setCurrentLocation();
  }

  setCurrentLocation() async {
    currentLocation = await geolocatorService.getCurrentLocation();
    notifyListeners();
  }
}
