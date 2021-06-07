import 'package:google_maps_flutter/google_maps_flutter.dart';

class Resturant {
  String shopName;
  String address;
  String description;
  String thumbNail;
  LatLng locationCoords;

  Resturant(
      {this.shopName,
      this.address,
      this.description,
      this.thumbNail,
      this.locationCoords});
}

final List<Resturant> coffeeShops = [
  Resturant(
      shopName: 'The Kave',
      address: 'Lot 7, Arked Cengal UTM ',
      description: 'Arked Cengal,',
      locationCoords: LatLng(1.5617, 103.6321),
      thumbNail: ''),
  Resturant(
      shopName: 'The Kave',
      address: 'Lot 7, Arked Cengal UTM ',
      description: 'Arked Cengal,',
      locationCoords: LatLng(1.5617, 103.6321),
      thumbNail: ''),
];
