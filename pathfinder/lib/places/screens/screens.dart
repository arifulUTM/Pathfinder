import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pathfinder/places/blocs/application_bloc.dart';
import 'package:provider/provider.dart';

class Places extends StatefulWidget {
  Places({Key key}) : super(key: key);

  @override
  _PlacesState createState() => _PlacesState();
}

class _PlacesState extends State<Places> {
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search Location",
                        suffixIcon: Icon(Icons.search)),
                    onChanged: (value) => applicationBloc.searchPlaces(value),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      height: 300.0,
                      child: GoogleMap(
                        mapType: MapType.hybrid,
                        myLocationButtonEnabled: true,
                        initialCameraPosition: CameraPosition(
                            target: LatLng(
                                applicationBloc.currentLocation.latitude,
                                applicationBloc.currentLocation.longitude),
                            zoom: 14),
                      ),
                    ),
                    if (applicationBloc.searchResults != null &&
                        applicationBloc.searchResults.length != 0)
                      Container(
                        height: 300.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.6),
                            backgroundBlendMode: BlendMode.darken),
                      ),
                    if (applicationBloc.searchResults != null)
                      Container(
                        height: 300.0,
                        child: ListView.builder(
                            itemCount: applicationBloc.searchResults.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  applicationBloc
                                      .searchResults[index].description,
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            }),
                      ),
                  ],
                ),
              ],
            ),
    );
  }
}
