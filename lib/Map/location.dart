import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:metiz_cinema/components/app_bar_home.dart';
import 'package:metiz_cinema/screen/about.dart';

class MapMultiMarker extends StatefulWidget {
  const MapMultiMarker({Key? key}) : super(key: key);

  @override
  State<MapMultiMarker> createState() => _MapMultiMarkerState();
}

class _MapMultiMarkerState extends State<MapMultiMarker> {
  final List<Map<String, dynamic>> clityList = const [
    {
      "address": "Đ. 2 Tháng 9, Hoà Cường Bắc, Hải Châu, Đà Nẵng 550000, Việt Nam",
      "id": "01",
      "lat": 16.036272576880126,
      "lng": 108.22425276971148,
      "name": "MetizCinema-Đà Nẵng",
      "phone": "02363630689",
    }
  ];

  final Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _markers.clear();
    setState(() {
      for (int i = 0; i < clityList.length; i++) {
        print("For Loop");
        final marker = Marker(
          markerId: MarkerId(clityList[i]['name']),
          position: LatLng(clityList[i]['lat'], clityList[i]['lng']),
          infoWindow: InfoWindow(
              title: clityList[i]['name'],
              snippet: clityList[i]['address'],
              onTap: () {
                print("${clityList[i]['lat']}, ${clityList[i]['lng']}");
                launchMap(clityList[i]['lat'], clityList[i]['lng']);
              }),
          onTap: () {
            print("Clicked on marker");
          },
        );
        print("${clityList[i]['lat']}, ${clityList[i]['lng']}");
        _markers[clityList[i]['name']] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => About()));
        }, icon: Icon(Icons.keyboard_backspace, color: Colors.white,)),
        title: Text("Google Map", style: TextStyle(
          color: Colors.white,
        ),)
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(clityList[0]['lat'], clityList[0]['lng']),
          zoom: 4.8,
        ),
        markers: _markers.values.toSet(),
      ),
    );
  }
}
launchMap(lat, long) {
  MapsLauncher.launchCoordinates(lat, long);
}