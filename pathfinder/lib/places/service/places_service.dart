import 'package:pathfinder/places/models/place_search.dart';

import 'package:http/http.dart' as http;

import 'dart:convert' as convert;

class PlacesService {
  final key = 'AIzaSyDLPSW6rXZb8aJMN-1hWRGrC7TJf96N0lc';

  Future<List<PlaceSearch>> getAutocomplete(String search) async {
    var url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types=(cities)&key');

    var response = await http.get(url);
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['predictions'] as List;

    return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
  }
}
