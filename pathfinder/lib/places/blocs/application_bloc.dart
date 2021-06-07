import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pathfinder/places/models/place_search.dart';
import 'package:pathfinder/places/service/geolocator_service.dart';
import 'package:flutter/material.dart';
import 'package:pathfinder/places/service/places_service.dart';

class Applicationbloc with ChangeNotifier {
  final geoLocatorService = GeolocatorService();
  final placesService = PlacesService();

  // Variables

  Position currentLocation;

  List<PlaceSearch> searchResults;

  Applicationbloc() {
    setCurrentLocation();
  }

  setCurrentLocation() async {
    currentLocation = await geoLocatorService.getCurrentLocation();
    notifyListeners();
  }

  searchPlaces(String searchTerm) async {
    await placesService.getAutocomplete(searchTerm);
    notifyListeners();
  }
}
