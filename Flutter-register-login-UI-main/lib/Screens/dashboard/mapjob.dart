import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapJob extends StatefulWidget {
  @override
  _MapJobState createState() => _MapJobState();
}

class _MapJobState extends State<MapJob> {
  Position userLocation;
  GoogleMapController mapController;

  Set<Marker> _markers = {};
  BitmapDescriptor mapMarker;

  @override
  void initState() {
    super.initState();
    setCustomMarker();
  }

  void setCustomMarker() async{
    // mapMarker = await BitmapDescriptor.fromAssetImage(ImageConfiguration(),'');
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('1'),
          position: LatLng(13.784749, 100.630561),
          // icon: mapMarker,
          infoWindow: InfoWindow(
            title: 'Test',
            snippet: 'A',
          ),
        ),
      );
    });
    mapController = controller;
  }

  Future<Position> _getLocation() async {
    try {
      userLocation = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      userLocation = null;
    }
    return userLocation;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ค้นหางานใกล้ตัวคุณ"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => {
              
            },
          ),
        actions: [
          TextButton.icon(
            style: TextButton.styleFrom(
              textStyle: TextStyle(color: Colors.blue),
            ),
            onPressed: () {
              mapController.animateCamera(CameraUpdate.newLatLngZoom(
                  LatLng(userLocation.latitude, userLocation.longitude), 18));
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text("Your Location"),
                    );
                  });
            },
            icon: Icon(
              Icons.near_me,
              color: Colors.white,
            ),
            label: Text(
              "ไปยังตำแหน่งของคุณ",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: FutureBuilder(
        future: _getLocation(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return GoogleMap(
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              markers: _markers,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                  target: LatLng(userLocation.latitude, userLocation.longitude),
                  zoom: 15),
            );
          } else {
            return Center(
              child: Column(
                children: [
                  CircularProgressIndicator(),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
