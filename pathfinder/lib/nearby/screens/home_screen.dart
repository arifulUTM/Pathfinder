import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:pathfinder/nearby/blocs/application_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<Applicationbloc>(context);

    return Scaffold(
      body: (applicationBloc.currentLocation == null)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                TextField(
                  decoration: InputDecoration(hintText: 'Search Location'),
                ),
                Container(
                  height: 300.0,
                  child: GoogleMap(
                      mapType: MapType.normal,
                      myLocationButtonEnabled: true,
                      initialCameraPosition: CameraPosition(
                          target: LatLng(
                            applicationBloc.currentLocation.latitude,
                            applicationBloc.currentLocation.longitude,
                          ),
                          zoom: 14)),
                ),
              ],
            ),
    );
  }
}
